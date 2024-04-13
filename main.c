#include <arm_acle.h>
#include <arm_sve.h>
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern float v_sparse_dot(uint32_t *lhs_idx, uint32_t *rhs_idx, float *lhs_val,
                          float *rhs_val, size_t lhs_len, size_t rhs_len);
extern float v_sparse_dot_omp(uint32_t *lhs_idx, uint32_t *rhs_idx,
                              float *lhs_val, float *rhs_val, size_t lhs_len,
                              size_t rhs_len);
extern float v_sparse_dot_sve(uint32_t *lhs_idx, uint32_t *rhs_idx,
                              float *lhs_val, float *rhs_val, size_t lhs_len,
                              size_t rhs_len);

int main(int argc, char **argv) {
  size_t n = atoi(argv[1]);
  size_t iter = atoi(argv[2]);
  assert(n < 1000);
  uint32_t lhs_idx[1000];
  uint32_t rhs_idx[1000];
  float lhs_val[1000];
  float rhs_val[1000];
  srand(time(NULL));
  size_t idx_l = 0, idx_r = 0;
  for (size_t i = 0; i < 10000; i++) {
    if (rand() < RAND_MAX / 10000 * n && idx_l < 1000) {
      lhs_idx[idx_l] = i;
      lhs_val[idx_l++] = (float)rand() / (float)RAND_MAX;
    }
    if (rand() < RAND_MAX / 10000 * n && idx_r < 1000) {
      rhs_idx[idx_r] = i;
      rhs_val[idx_r++] = (float)rand() / (float)RAND_MAX;
    }
  }
  struct timespec tstart = {0, 0}, tend = {0, 0};
  float xy = 0;
  for (size_t i = 0; i < iter; i++) {
    xy = v_sparse_dot(lhs_idx, rhs_idx, lhs_val, rhs_val, idx_l, idx_r);
  }
  clock_gettime(CLOCK_MONOTONIC, &tstart);
  for (size_t i = 0; i < iter; i++) {
    xy = v_sparse_dot(lhs_idx, rhs_idx, lhs_val, rhs_val, idx_l, idx_r);
  }
  clock_gettime(CLOCK_MONOTONIC, &tend);
  printf(
      "v_sparse_dot ------ Value: %f, Time: %.2fns/iter\n", xy,
      ((tend.tv_sec - tstart.tv_sec) * 1e9 + (tend.tv_nsec - tstart.tv_nsec)) /
          (double)iter);

  for (size_t i = 0; i < iter; i++) {
    xy = v_sparse_dot_omp(lhs_idx, rhs_idx, lhs_val, rhs_val, idx_l, idx_r);
  }
  clock_gettime(CLOCK_MONOTONIC, &tstart);
  for (size_t i = 0; i < iter; i++) {
    xy = v_sparse_dot_omp(lhs_idx, rhs_idx, lhs_val, rhs_val, idx_l, idx_r);
  }
  clock_gettime(CLOCK_MONOTONIC, &tend);
  printf(
      "v_sparse_dot_omp -- Value: %f, Time: %.2fns/iter\n", xy,
      ((tend.tv_sec - tstart.tv_sec) * 1e9 + (tend.tv_nsec - tstart.tv_nsec)) /
          (double)iter);

  for (size_t i = 0; i < iter; i++) {
    xy = v_sparse_dot_sve(lhs_idx, rhs_idx, lhs_val, rhs_val, idx_l, idx_r);
  }
  clock_gettime(CLOCK_MONOTONIC, &tstart);
  for (size_t i = 0; i < iter; i++) {
    xy = v_sparse_dot_sve(lhs_idx, rhs_idx, lhs_val, rhs_val, idx_l, idx_r);
  }
  clock_gettime(CLOCK_MONOTONIC, &tend);
  printf(
      "v_sparse_dot_sve -- Value: %f, Time: %.2fns/iter\n", xy,
      ((tend.tv_sec - tstart.tv_sec) * 1e9 + (tend.tv_nsec - tstart.tv_nsec)) /
          (double)iter);
}
