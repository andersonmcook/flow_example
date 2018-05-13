defmodule FlowExample do
  @moduledoc false

  @not_word ~r/\W/

  @doc """
  """
  def count_words(file_path) do
    file_path
    |> File.stream!()
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, @not_word))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  @doc """
  Use Flow to count words in a directory
  """
  def count_words_in_dir(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.stream!/1)
    |> Flow.from_enumerables()
    |> Flow.flat_map(&String.split(&1, @not_word))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  @doc """
  Use Flow to count words in a directory, using take_sort
  """
  def count_words_in_dir_take_sort(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.stream!/1)
    |> Flow.from_enumerables()
    |> Flow.flat_map(&String.split(&1, @not_word))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &word_count/2)
    |> Flow.take_sort(20, &by_count/2)
    |> Enum.at(0)
  end

  @doc """
  Use Flow to count words in a directory using an ets table
  """
  def count_words_in_dir_ets(dir) do
    parent = self()

    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.stream!(&1, read_ahead: 100_000))
    |> Flow.from_enumerables()
    |> Flow.flat_map(&String.split(&1, @not_word))
    |> Flow.map(&clean/1)
    |> Flow.filter(&word?/1)
    |> Flow.partition()
    |> Flow.reduce(&create_table/0, &update_table/2)
    |> Flow.map_state(&transfer_and_select(&1, parent))
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  defp create_table do
    :ets.new(:words, [])
  end

  defp update_table(word, table) do
    :ets.update_counter(table, word, {2, 1}, {word, 0})
    table
  end

  defp transfer_and_select(table, parent) do
    :ets.give_away(table, parent, [])
    :ets.match_object(table, {:"$1", :"$2"})
  end

  @doc """
  Use Enum to count words in a directory
  """
  def count_words_in_dir_reg(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.read!/1)
    |> Enum.flat_map(&String.split(&1, @not_word))
    |> Enum.map(&clean/1)
    |> Enum.filter(&word?/1)
    |> Enum.reduce(%{}, &word_count/2)
    |> Enum.to_list()
    |> Enum.sort(&by_count/2)
    |> Enum.take(20)
  end

  @doc """
  Use Stream to count words in a directory
  """
  def count_words_in_dir_stream(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&(Path.extname(&1) === ".txt"))
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.map(&File.stream!/1)
    |> Stream.concat()
    |> Stream.flat_map(&String.split(&1, @not_word))
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
    |> String.split(@not_word)
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
    |> Flow.flat_map(&String.split(&1, @not_word))
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
