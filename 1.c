#include <arm_neon.h>
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern void compare(const uint32_t *array1, const uint32_t *array2,
                    uint8_t *result, size_t size) {
  for (size_t i = 0; i < size; i++) {
    result[i] = array1[i] == array2[i];
  }
}

extern void test1(const uint32_t *array1, const uint32_t *array2,
                  uint8_t *result1, uint8_t *result2, size_t size) {
  assert(size < 8);
  uint8_t res1 = 0, res2 = 0;
  for (size_t i = 0; i < size; i++) {
    for (size_t j = 0; j < size; j++) {
      uint8_t res = array1[i] == array2[j];
      res1 |= res << i;
      res2 |= res << j;
    }
  }
  *result1 = res1;
  *result2 = res2;
}

int main() {
  uint32_t array1[1000];
  uint32_t array2[1000];
  uint8_t result[1000];
  srand(time(NULL));
  for (size_t i = 0; i < 1000; i++) {
    array1[i] = rand() % 100;
    array2[i] = rand() % 100;
  }
  compare(array1, array2, result, 1000);
  for (size_t i = 0; i < 1000; i++) {
    if (result[i] == 1)
      printf("%ld ", i);
  }
  printf("\n");
  return 0;
}