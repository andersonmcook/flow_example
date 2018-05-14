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
    * Take top n words
  """

  @not_word ~r/[^\w'-]+/
  @num 20

  @doc """
  Use Enum
  """
  def enum(dir) do

  end

  @doc """
  Use Stream
  """
  def stream(dir) do

  end

  @doc """
  Use Flow
  """
  def flow(dir) do

  end

  @doc """
  Use Flow and Flow.take_sort/3
  """
  def flow_take_sort(dir) do

  end

  @doc """
  Use Flow and ETS
  """
  def flow_ets(dir) do

  end
end
