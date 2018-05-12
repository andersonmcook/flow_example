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
flow             0.48         2.10 s     ±1.59%         2.11 s         2.13 s
stream          0.155         6.45 s     ±0.00%         6.45 s         6.45 s
regular         0.128         7.79 s     ±0.00%         7.79 s         7.79 s

Comparison: 
flow             0.48
stream          0.155 - 3.07x slower
regular         0.128 - 3.70x slower
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
        average: 2103974.6666666665,
        ips: 0.47529089387007833,
        maximum: 2133467,
        median: 2110733.0,
        minimum: 2067724,
        mode: nil,
        percentiles: %{50 => 2110733.0, 99 => 2133467.0},
        sample_size: 3,
        std_dev: 33388.498234172395,
        std_dev_ips: 0.007542509623388683,
        std_dev_ratio: 0.015869249170699328
      },
      run_times: [2110733, 2067724, 2133467],
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
        average: 7790050.0,
        ips: 0.1283688808159126,
        maximum: 7790050,
        median: 7790050.0,
        minimum: 7790050,
        mode: nil,
        percentiles: %{50 => 7790050.0, 99 => 7790050.0},
        sample_size: 1,
        std_dev: 0,
        std_dev_ips: 0.0,
        std_dev_ratio: 0.0
      },
      run_times: [7790050],
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
        average: 6453393.0,
        ips: 0.15495724497175362,
        maximum: 6453393,
        median: 6453393.0,
        minimum: 6453393,
        mode: nil,
        percentiles: %{50 => 6453393.0, 99 => 6453393.0},
        sample_size: 1,
        std_dev: 0,
        std_dev_ips: 0.0,
        std_dev_ratio: 0.0
      },
      run_times: [6453393],
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
