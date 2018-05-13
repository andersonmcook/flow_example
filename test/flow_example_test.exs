defmodule FlowExampleTest do
  use ExUnit.Case
  doctest FlowExample

  test "all are equal" do
    dir = "txts"
    expected = [
      {"the", 52245},
      {"and", 30041},
      {"of", 27650},
      {"to", 24577},
      {"a", 21497},
      {"in", 17442},
      {"i", 16346},
      {"he", 16191},
      {"that", 14070},
      {"it", 12998},
      {"his", 11802},
      {"you", 11199},
      {"was", 11079},
      {"s", 8949},
      {"with", 8892},
      {"for", 8496},
      {"but", 7023},
      {"him", 6935},
      {"at", 6745},
      {"not", 6731}
    ]

    assert FlowExample.count_words_in_dir(dir) === expected
    assert FlowExample.count_words_in_dir_take_sort(dir) === expected
    assert FlowExample.count_words_in_dir_ets(dir) === expected
    assert FlowExample.count_words_in_dir_stream(dir) === expected
    assert FlowExample.count_words_in_dir_reg(dir) === expected
  end
end
