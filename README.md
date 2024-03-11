benchmark on `Neoverse-V1 (Graviton 3)` 

```
❯ ./main 300 1
v_sparse_dot ------ Value: 3.507718, Time: 2757.00ns/iter
v_sparse_dot_omp -- Value: 3.507718, Time: 3416.00ns/iter
v_sparse_dot_sve -- Value: 3.507718, Time: 1560.00ns/iter

❯ ./main 300 100
v_sparse_dot ------ Value: 3.511603, Time: 951.56ns/iter
v_sparse_dot_omp -- Value: 3.511603, Time: 1218.24ns/iter
v_sparse_dot_sve -- Value: 3.511603, Time: 1056.71ns/iter
```
