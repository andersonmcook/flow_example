defmodule Benchmark do
  @moduledoc false

  import FlowExample

  def compare_dir do
    dir = "txts"

    Benchee.run(%{
      "flow" => fn -> count_words_in_dir(dir) end,
      "flow_take_sort" => fn -> count_words_in_dir_take_sort(dir) end,
      "flow_ets" => fn -> count_words_in_dir_ets(dir) end,
      "stream" => fn -> count_words_in_dir_stream(dir) end,
      "enum" => fn -> count_words_in_dir_reg(dir) end
    })
  end
end
