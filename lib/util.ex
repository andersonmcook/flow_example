defmodule Util do
  @doc """
  Clean-up words
  """
  def clean(word) do
    ~r/[^A-zÀ-ÿ'-]/
    |> Regex.replace(word, "")
    |> String.trim()
    |> String.downcase()
  end

  @doc """
  Filter out empty strings
  """
  def not_empty(""), do: false
  def not_empty(_), do: true

  @doc """
  Update map, incrementing value at word key
  """
  def word_count(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end

  @doc """
  Compare tuples via their second value
  """
  def by_count(a, b) do
    elem(a, 1) > elem(b, 1)
  end

  @doc """
  Create a new ETS table called :words
  """
  def create_table do
    :ets.new(:words, [])
  end

  @doc """
  Update table similarly to word_count/2
  """
  def update_table(word, table) do
    :ets.update_counter(table, word, {2, 1}, {word, 0})
    table
  end

  @doc """
  Transfer ownership of table and get all values
  """
  def transfer_and_select(table, parent) do
    :ets.give_away(table, parent, [])
    :ets.match_object(table, {:"$1", :"$2"})
  end
end
