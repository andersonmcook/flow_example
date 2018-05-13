defmodule FlowExampleTest do
  use ExUnit.Case
  doctest FlowExample

  test "all are equal" do
    dir = "txts"
    expected = [
      {"the", 52151},
      {"and", 29898},
      {"of", 27599},
      {"to", 24481},
      {"a", 21419},
      {"in", 17379},
      {"i", 16077},
      {"he", 16033},
      {"that", 13941},
      {"it", 12828},
      {"his", 11786},
      {"you", 11125},
      {"was", 11071},
      {"with", 8881},
      {"for", 8467},
      {"but", 6961},
      {"him", 6916},
      {"at", 6739},
      {"not", 6710},
      {"is", 6696}
    ]

    assert FlowExample.count_words_in_dir(dir) === expected
    assert FlowExample.count_words_in_dir_take_sort(dir) === expected
    assert FlowExample.count_words_in_dir_ets(dir) === expected
    assert FlowExample.count_words_in_dir_stream(dir) === expected
    assert FlowExample.count_words_in_dir_enum(dir) === expected
  end
end
