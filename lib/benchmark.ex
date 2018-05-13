defmodule Benchmark do
  @moduledoc false

  import FlowExample

  def compare_dir do
    tests = %{
      enum: &count_words_in_dir_enum/1,
      flow: &count_words_in_dir/1,
      flow_ets: &count_words_in_dir_ets/1,
      flow_take_sort: &count_words_in_dir_take_sort/1,
      stream: &count_words_in_dir_stream/1
    }

    opts = [
      time: 10,
      memory_time: 10,
      inputs: %{"dir" => "txts"}
    ]

    Benchee.run(tests, opts)
  end
end
