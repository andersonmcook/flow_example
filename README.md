# flow_example
Flow vs Stream vs Enum
```bash
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 μs
parallel: 1
inputs: none specified
Estimated total run time: 35 s


Benchmarking enum...
Benchmarking flow...
Benchmarking flow_ets...
Benchmarking flow_take_sort...
Benchmarking stream...

Name                     ips        average  deviation         median         99th %
flow_ets                0.56         1.79 s     ±2.81%         1.77 s         1.85 s
flow                    0.53         1.90 s    ±10.43%         1.79 s         2.13 s
flow_take_sort          0.50         2.02 s     ±2.45%         2.05 s         2.05 s
stream                 0.154         6.50 s     ±0.00%         6.50 s         6.50 s
enum                   0.121         8.28 s     ±0.00%         8.28 s         8.28 s

Comparison: 
flow_ets                0.56
flow                    0.53 - 1.06x slower
flow_take_sort          0.50 - 1.13x slower
stream                 0.154 - 3.62x slower
enum                   0.121 - 4.62x slower
```
