defmodule Benchmark do
  @moduledoc false

  import FlowExample

  def compare_dir do
    dir = "txts"

    Benchee.run(%{
      "flow" => fn -> count_words_in_dir(dir) end,
      "flow_opt" => fn -> count_words_in_dir_opt(dir) end,
      "stream" => fn -> count_words_in_dir_stream(dir) end,
      "enum" => fn -> count_words_in_dir_reg(dir) end
    })
  end
end
