defmodule Reader do
  @moduledoc """
  Given a directory of .txt files:
    * List the files in the directory
    * Filter out files with extensions not .txt
    * Read or stream the files
    * Split the text into words
    * Clean up words
    * Filter out empty strings
    * Create a map where the keys are words and the values are the number of times the word has been used in the text
    * Convert to list of tuples
    * Sort list by word count
    * Get top words
  """

  @not_word ~r/[^\w'-]+/
  @num 20

  @doc """
  Use Enum
  """
  def enum(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&Util.txt?/1)
    |> Enum.map(&Util.join_path(&1, dir))
    |> Enum.map(&File.read!/1)
    |> Enum.flat_map(&String.split(&1, @not_word))
    |> Enum.map(&Util.clean/1)
    |> Enum.filter(&Util.not_empty?/1)
    |> Enum.reduce(%{}, &Util.word_count/2)
    |> Enum.to_list()
    # |> Enum.sort(&Util.by_count/2)
    |> Enum.sort_by(fn tuple -> elem(tuple, 1) end, &>=/2)
    |> Enum.take(@num)
  end

  @doc """
  Use Stream
  """
  def stream(dir) do
    dir
    |> File.ls!()
    |> Stream.filter(&Util.txt?/1)
    |> Stream.map(&Util.join_path(&1, dir))
    |> Stream.map(&File.stream!/1)
    |> Stream.concat()
    |> Stream.flat_map(&String.split(&1, @not_word))
    |> Stream.map(&Util.clean/1)
    |> Stream.filter(&Util.not_empty?/1)
    |> Enum.reduce(%{}, &Util.word_count/2)
    |> Enum.to_list()
    |> Enum.sort_by(fn tuple -> elem(tuple, 1) end, &>=/2)
    |> Enum.take(@num)
  end

  @doc """
  Use Flow
  """
  def flow(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&Util.txt?/1)
    |> Enum.map(&Util.join_path(&1, dir))
    |> Enum.map(&File.stream!/1)
    |> Flow.from_enumerables(max_demand: 16)
    |> Flow.flat_map(&String.split(&1, @not_word))
    |> Flow.map(&Util.clean/1)
    |> Flow.filter(&Util.not_empty?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &Util.word_count/2)
    |> Enum.to_list()
    |> Enum.sort_by(fn tuple -> elem(tuple, 1) end, &>=/2)
    |> Enum.take(@num)
  end

  @doc """
  Use Flow and Flow.take_sort/3
  """
  def flow_take_sort(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&Util.txt?/1)
    |> Enum.map(&Util.join_path(&1, dir))
    |> Enum.map(&File.stream!/1)
    |> Flow.from_enumerables()
    |> Flow.flat_map(&String.split(&1, @not_word))
    |> Flow.map(&Util.clean/1)
    |> Flow.filter(&Util.not_empty?/1)
    |> Flow.partition()
    |> Flow.reduce(&Map.new/0, &Util.word_count/2)
    |> Flow.take_sort(@num, &Util.by_count/2)
    |> Enum.at(0)
  end

  @doc """
  Use Flow and ETS
  """
  def flow_ets(dir) do
  end
end
