import Integer

defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Reads the Historian Hysteria Input
  """

  def readFile() do
    File.read("historian_hysteria_input.txt")
  end

  @doc """
  Takes the input of the file and returns then as a list

  ## Examples

      iex> Day1.extractNumbers(["1 2\r\n3 4\r\n"])
      [1, 2, 3, 4]
  """

  def extractNumbers(file) do
    array = String.split(file, "   ")
    for s <- array, times <- 1..length(String.split(s, "\r\n")) do
      String.to_integer(Enum.at(String.split(s, "\r\n"), times-1))
    end
  end

  @doc """
  Returns the left column of numbers from the serialized representation of the file
  """

  def getLeftColumn(array) do
    for i <- 0..length(array)-1, is_even(i) do
      Enum.at(array, i)
    end
  end

  @doc """
  Returns the right column of numbers from the serialized representation of the file
  """

  def getRightColumn(array) do
    for i <- 0..length(array)-1, not is_even(i) do
      Enum.at(array, i)
    end
  end


  @doc """
  returns the list sorted

  ## Examples

      iex> Day1.sort([3, 2, 1])
      [1, 2, 3]
  """
  def sort(list), do: Enum.sort(list)

  @doc """
  returns the sum of the differences between the left and right lists
  """
  def getDiff(left, right) do
    for i <- 0..999 do
      abs(Enum.at(left, i) - Enum.at(right, i))
    end
    |> Enum.sum()
  end

@doc """
returns a frequency map of the elements in the list.

## Examples

    iex> Day1.frequencies([1, 2])
    %{1 => 1, 2 => 1}
"""

def frequencies(list), do: Enum.frequencies(list)

@doc """
Returns the similarities of the left and right column with frequencies leftFrequencies and rightFrequencies
"""
def calculateSimilarities(left, leftFrequencies, rightFrequencies) do
  leftMap = Enum.map(left, fn x -> {x , Map.get(rightFrequencies, x)} end)

  simlarities = for l <- Map.keys(leftFrequencies) do
  sharedFreq = elem(List.keyfind(leftMap, l, 0), 1)
    if sharedFreq != nil do
      l * Map.get(leftFrequencies, l) * sharedFreq
    else
      0
    end
  end
  Enum.sum(simlarities)
end


end
