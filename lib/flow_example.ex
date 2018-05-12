defmodule FlowExample do
  @moduledoc false

  def count_words(file_path) do
    file_path
    |> File.stream!()
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, ~r/\W/))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.slice(0..19)
  end

  def count_words_in_dir(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.stream!/1)
    |> Flow.from_enumerables()
    |> Flow.flat_map(&String.split(&1, ~r/\W/))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.slice(0..19)
  end

  def count_words_in_dir_reg(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.read!/1)
    |> Enum.flat_map(&String.split(&1, ~r/\W/))
    |> Enum.map(&clean/1)
    |> Enum.filter(&word?/1)
    |> Enum.reduce(%{}, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  def count_words_in_dir_stream(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.stream!/1)
    |> Stream.concat()
    |> Stream.flat_map(&String.split(&1, ~r/\W/))
    |> Stream.map(&clean/1)
    |> Stream.filter(&word?/1)
    |> Enum.reduce(%{}, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  def count_words_no_flow(file_path) do
    file_path
    |> File.read!()
    |> String.split(~r/\W/)
    |> Enum.map(&clean/1)
    |> Enum.filter(&word?/1)
    |> Enum.reduce(%{}, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  def longest_word(file_path) do
    file_path
    |> File.stream!()
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, ~r/\W/))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &word_count/2)
    |> Enum.to_list()
    |> Enum.max_by(fn {word, _} -> String.length(word) end)
  end

  defp clean(word) do
    ~r/[^A-z]/
    |> Regex.replace(word, "")
    |> String.trim()
    |> String.downcase()
  end

  defp word?(word) do
    Regex.match?(~r/\w/, word)
  end

  defp word_count(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end

  defp by_count(a, b) do
    elem(a, 1) > elem(b, 1)
  end
end
