# flow_example
Flow vs Stream vs Enum
```bash
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 10 s
parallel: 1
inputs: dir
Estimated total run time: 1.83 min


Benchmarking enum with input dir...
Benchmarking flow with input dir...
Benchmarking flow_ets with input dir...
Benchmarking flow_take_sort with input dir...
Benchmarking stream with input dir...

##### With input dir #####
Name                     ips        average  deviation         median         99th %
flow                    0.72         1.39 s     ±3.83%         1.37 s         1.46 s
flow_ets                0.69         1.46 s     ±1.38%         1.45 s         1.49 s
flow_take_sort          0.66         1.51 s     ±1.33%         1.51 s         1.55 s
stream                  0.20         4.95 s     ±0.73%         4.95 s         4.99 s
enum                   0.172         5.82 s     ±1.44%         5.82 s         5.88 s

Comparison:
flow                    0.72
flow_ets                0.69 - 1.05x slower
flow_take_sort          0.66 - 1.08x slower
stream                  0.20 - 3.56x slower
enum                   0.172 - 4.19x slower

Memory usage statistics:

Name                   average  deviation         median         99th %
flow                 0.0142 GB     ±3.67%      0.0145 GB      0.0149 GB
flow_ets             0.0144 GB     ±3.14%      0.0146 GB      0.0148 GB
flow_take_sort      0.00001 GB     ±0.49%     0.00001 GB     0.00001 GB
stream                 1.89 GB     ±0.00%        1.89 GB        1.89 GB
enum                   1.68 GB     ±0.00%        1.68 GB        1.68 GB

Comparison:
flow                 0.0145 GB
flow_ets             0.0146 GB - 1.01x memory usage
flow_take_sort      0.00001 GB - 0.00x memory usage
stream                 1.89 GB - 130.34x memory usage
enum                   1.68 GB - 115.87x memory usage
```
