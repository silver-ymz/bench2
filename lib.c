#include <arm_acle.h>
#include <arm_sve.h>
#include <stddef.h>
#include <stdint.h>

float v_sparse_dot(uint32_t *lhs_idx, uint32_t *rhs_idx, float *lhs_val,
                   float *rhs_val, size_t lhs_len, size_t rhs_len) {
  size_t lhs_pos = 0, rhs_pos = 0;
  float xy = 0;
  while (lhs_pos < lhs_len && rhs_pos < rhs_len) {
    if (lhs_idx[lhs_pos] == rhs_idx[rhs_pos]) {
      xy += lhs_val[lhs_pos] * rhs_val[rhs_pos];
      lhs_pos++;
      rhs_pos++;
    } else if (lhs_idx[lhs_pos] < rhs_idx[rhs_pos]) {
      lhs_pos++;
    } else {
      rhs_pos++;
    }
  }
  return xy;
}

#define min(a, b) ((a) < (b) ? (a) : (b))

float v_sparse_dot_omp(uint32_t *lhs_idx, uint32_t *rhs_idx, float *lhs_val,
                       float *rhs_val, size_t lhs_len, size_t rhs_len) {
  const size_t chunk = 8;
  size_t lhs_pos = 0, rhs_pos = 0, lhs_loop_len = lhs_len / chunk * chunk,
         rhs_loop_len = rhs_len / chunk * chunk;
  float buff_l[chunk], buff_r[chunk], xy = 0;
#pragma omp parallel for reduction(+ : xy)
  while (lhs_pos < lhs_loop_len && rhs_pos < rhs_loop_len) {
    uint8_t m1 = 0, m2 = 0;
#pragma omp reduction(| : m1) reduction(| : m2)
    for (size_t i = 0; i < chunk; i++) {
      for (size_t j = 0; j < chunk; j++) {
        uint8_t res = lhs_idx[lhs_pos + i] == rhs_idx[rhs_pos + j];
        m1 |= res << i;
        m2 |= res << j;
      }
    }
    uint8_t il = 0, ir = 0;
#pragma omp simd
    for (size_t i = 0; i < chunk; i++) {
      if (m1 & (1 << i)) {
        buff_l[il++] = lhs_val[lhs_pos + i];
      }
      if (m2 & (1 << i)) {
        buff_r[ir++] = rhs_val[rhs_pos + i];
      }
    }
#pragma omp simd
    for (size_t i = 0; i < min(il, ir); i++) {
      xy += buff_l[i] * buff_r[i];
    }
    uint32_t idx_l = lhs_idx[lhs_pos + chunk - 1];
    uint32_t idx_r = rhs_idx[rhs_pos + chunk - 1];
    if (idx_l < idx_r) {
      lhs_pos += chunk;
    } else if (idx_l > idx_r) {
      rhs_pos += chunk;
    } else {
      lhs_pos += chunk;
      rhs_pos += chunk;
    }
  }
  return xy + v_sparse_dot(lhs_idx + lhs_pos, rhs_idx + rhs_pos,
                           lhs_val + lhs_pos, rhs_val + rhs_pos,
                           lhs_len - lhs_pos, rhs_len - rhs_pos);
}

float v_sparse_dot_sve(uint32_t *lhs_idx, uint32_t *rhs_idx, float *lhs_val,
                       float *rhs_val, size_t lhs_len, size_t rhs_len) {
  const size_t chunk = svcntw();
  uint32_t mb_r[2048 / 32];
  size_t lhs_pos = 0, rhs_pos = 0, lhs_loop_len = lhs_len / chunk * chunk,
         rhs_loop_len = rhs_len / chunk * chunk;
  svfloat32_t xy = svdup_f32(0);
  while (lhs_pos < lhs_loop_len && rhs_pos < rhs_loop_len) {
    svuint32_t idx_l = svld1_u32(svptrue_b32(), lhs_idx + lhs_pos);
    svbool_t m_l = svpfalse();
    size_t i_r = 0;
    for (size_t i = 0; i < chunk; i++) {
      svuint32_t tmp_r = svdup_u32(rhs_idx[rhs_pos + i]);
      svbool_t p = svcmpeq_u32(svptrue_b32(), tmp_r, idx_l);
      m_l = svorr_b_z(svptrue_b8(), m_l, p);
      if (svptest_any(svptrue_b32(), p)) {
        mb_r[i_r++] = i;
      }
    }
    svuint32_t m_r = svld1_u32(svwhilelt_b32((uint64_t)0, i_r), mb_r);
    svfloat32_t val_l = svld1_f32(svptrue_b32(), lhs_val + lhs_pos);
    svfloat32_t val_r = svld1_f32(svptrue_b32(), rhs_val + rhs_pos);
    val_l = svcompact_f32(m_l, val_l);
    val_r = svtbl_f32(val_r, m_r);
    xy = svmla_f32_m(svptrue_b32(), xy, val_l, val_r);
    uint32_t idx_l_last = lhs_idx[lhs_pos + chunk - 1];
    uint32_t idx_r_last = rhs_idx[rhs_pos + chunk - 1];
    if (idx_l_last < idx_r_last) {
      lhs_pos += chunk;
    } else if (idx_l_last > idx_r_last) {
      rhs_pos += chunk;
    } else {
      lhs_pos += chunk;
      rhs_pos += chunk;
    }
  }

  return svaddv_f32(svptrue_b32(), xy) +
         v_sparse_dot(lhs_idx + lhs_pos, rhs_idx + rhs_pos, lhs_val + lhs_pos,
                      rhs_val + rhs_pos, lhs_len - lhs_pos, rhs_len - rhs_pos);
}
