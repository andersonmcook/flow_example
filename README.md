# flow_example
Flow vs Stream vs Enum
```bash
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 μs
parallel: 1
inputs: none specified
Estimated total run time: 21 s


Benchmarking flow...
Benchmarking regular...
Benchmarking stream...

Name              ips        average  deviation         median         99th %
flow             0.56         1.80 s     ±0.89%         1.80 s         1.81 s
stream          0.152         6.58 s     ±0.00%         6.58 s         6.58 s
regular         0.129         7.76 s     ±0.00%         7.76 s         7.76 s

Comparison: 
flow             0.56
stream          0.152 - 3.66x slower
regular         0.129 - 4.32x slower
```
```elixir
%Benchee.Suite{
  configuration: %Benchee.Configuration{
    after_each: nil,
    after_scenario: nil,
    assigns: %{},
    before_each: nil,
    before_scenario: nil,
    formatter_options: %{
      console: %{comparison: true, extended_statistics: false}
    },
    formatters: [Benchee.Formatters.Console],
    inputs: nil,
    load: false,
    memory_time: 0,
    parallel: 1,
    pre_check: false,
    print: %{benchmarking: true, configuration: true, fast_warning: true},
    save: false,
    time: 5000000,
    unit_scaling: :best,
    warmup: 2000000
  },
  scenarios: [
    %Benchee.Benchmark.Scenario{
      after_each: nil,
      after_scenario: nil,
      before_each: nil,
      before_scenario: nil,
      function: #Function<0.105523825/0 in Benchmark.compare_dir/0>,
      input: :__no_input,
      input_name: :__no_input,
      job_name: "flow",
      memory_usage_statistics: %Benchee.Statistics{
        average: nil,
        ips: nil,
        maximum: nil,
        median: nil,
        minimum: nil,
        mode: nil,
        percentiles: nil,
        sample_size: 0,
        std_dev: nil,
        std_dev_ips: nil,
        std_dev_ratio: nil
      },
      memory_usages: [],
      name: "flow",
      run_time_statistics: %Benchee.Statistics{
        average: 1796856.6666666667,
        ips: 0.5565274173232144,
        maximum: 1807987,
        median: 1804052.0,
        minimum: 1778531,
        mode: nil,
        percentiles: %{50 => 1804052.0, 99 => 1807987.0},
        sample_size: 3,
        std_dev: 15991.98550316168,
        std_dev_ips: 0.00495308198758843,
        std_dev_ratio: 0.008899978389944855
      },
      run_times: [1807987, 1778531, 1804052],
      tag: nil
    },
    %Benchee.Benchmark.Scenario{
      after_each: nil,
      after_scenario: nil,
      before_each: nil,
      before_scenario: nil,
      function: #Function<2.105523825/0 in Benchmark.compare_dir/0>,
      input: :__no_input,
      input_name: :__no_input,
      job_name: "regular",
      memory_usage_statistics: %Benchee.Statistics{
        average: nil,
        ips: nil,
        maximum: nil,
        median: nil,
        minimum: nil,
        mode: nil,
        percentiles: nil,
        sample_size: 0,
        std_dev: nil,
        std_dev_ips: nil,
        std_dev_ratio: nil
      },
      memory_usages: [],
      name: "regular",
      run_time_statistics: %Benchee.Statistics{
        average: 7757435.0,
        ips: 0.12890858898592125,
        maximum: 7757435,
        median: 7757435.0,
        minimum: 7757435,
        mode: nil,
        percentiles: %{50 => 7757435.0, 99 => 7757435.0},
        sample_size: 1,
        std_dev: 0,
        std_dev_ips: 0.0,
        std_dev_ratio: 0.0
      },
      run_times: [7757435],
      tag: nil
    },
    %Benchee.Benchmark.Scenario{
      after_each: nil,
      after_scenario: nil,
      before_each: nil,
      before_scenario: nil,
      function: #Function<1.105523825/0 in Benchmark.compare_dir/0>,
      input: :__no_input,
      input_name: :__no_input,
      job_name: "stream",
      memory_usage_statistics: %Benchee.Statistics{
        average: nil,
        ips: nil,
        maximum: nil,
        median: nil,
        minimum: nil,
        mode: nil,
        percentiles: nil,
        sample_size: 0,
        std_dev: nil,
        std_dev_ips: nil,
        std_dev_ratio: nil
      },
      memory_usages: [],
      name: "stream",
      run_time_statistics: %Benchee.Statistics{
        average: 6580303.0,
        ips: 0.15196868594044985,
        maximum: 6580303,
        median: 6580303.0,
        minimum: 6580303, 
        mode: nil,
        percentiles: %{50 => 6580303.0, 99 => 6580303.0},
        sample_size: 1,
        std_dev: 0,
        std_dev_ips: 0.0,
        std_dev_ratio: 0.0
      },
      run_times: [6580303],
      tag: nil
    }
  ],
  system: %{
    available_memory: "16 GB",
    cpu_speed: "Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz",
    elixir: "1.6.5",
    erlang: "20.2.2",
    num_cores: 8,
    os: :macOS
  }
}
```
