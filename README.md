benchmark on `Neoverse-V1 (Graviton 3)` 

```
❯ ./main 300 10000
v_sparse_dot ------ Value: 1.024196, Time: 1582.09ns/iter
v_sparse_dot_omp -- Value: 1.024196, Time: 1082.45ns/iter
v_sparse_dot_sve -- Value: 1.024196, Time: 1027.85ns/iter
```
