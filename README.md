benchmark on `Neoverse-V1 (Graviton 3)` 

`CFLAGS=-Wall -O3 -march=armv8-a+sve`:
```
❯ ./main 300 10000
v_sparse_dot ------ Value: 3.028991, Time: 907.99ns/iter
v_sparse_dot_omp -- Value: 3.028991, Time: 1215.47ns/iter
v_sparse_dot_sve -- Value: 3.028991, Time: 1110.44ns/iter
```

`CFLAGS=-Wall -O3 -mcpu=neoverse-v1`:
```
❯ ./main 300 10000
v_sparse_dot ------ Value: 4.321673, Time: 1696.15ns/iter
v_sparse_dot_omp -- Value: 4.321673, Time: 1218.40ns/iter
v_sparse_dot_sve -- Value: 4.321673, Time: 1085.07ns/iter
```
