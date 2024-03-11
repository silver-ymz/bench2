benchmark on `Neoverse-V1 (Graviton 3)` 

```
❯ ./main 300 1
v_sparse_dot ------ Value: 3.564736, Time: 2901.00ns/iter
v_sparse_dot_omp -- Value: 3.564735, Time: 3359.00ns/iter
v_sparse_dot_sve -- Value: 3.564736, Time: 1695.00ns/iter

❯ ./main 300 100
v_sparse_dot ------ Value: 3.190038, Time: 862.88ns/iter
v_sparse_dot_omp -- Value: 3.190038, Time: 1878.43ns/iter
v_sparse_dot_sve -- Value: 3.190038, Time: 1306.46ns/iter
```
