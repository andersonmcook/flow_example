defmodule Benchmark do
  @moduledoc false

  @console [extended_statistics: true]
  @inputs %{dir: "txts"}
  @memory_time 10
  @time 10

  def compare_dir do
    tests = %{
      enum: &FlowExample.count_words_in_dir_enum/1,
      flow: &FlowExample.count_words_in_dir/1,
      flow_ets: &FlowExample.count_words_in_dir_ets/1,
      flow_take_sort: &FlowExample.count_words_in_dir_take_sort/1,
      stream: &FlowExample.count_words_in_dir_stream/1
    }

    opts = [
      console: @console,
      inputs: @inputs,
      memory_time: @memory_time,
      time: @time
    ]

    Benchee.run(tests, opts)
  end

  def compare do
    tests = %{
      enum: &Reader.enum/1,
      flow: &Reader.flow/1,
      flow_ets: &Reader.flow_ets/1,
      flow_take_sort: &Reader.flow_take_sort/1,
      stream: &Reader.stream/1
    }

    opts = [
      console: @console,
      inputs: @inputs,
      memory_time: @memory_time,
      time: @time
    ]

    Benchee.run(tests, opts)
  end
end
