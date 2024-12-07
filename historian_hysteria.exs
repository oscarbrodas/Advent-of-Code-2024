import Integer

# Part 1

# Read file
{_error, file} = File.read("historian_hysteria_input.txt")

# Seperate out numbers in file
array = String.split(file, "   ")
array = for s <- array, times <- 1..length(String.split(s, "\r\n")) do
  String.to_integer(Enum.at(String.split(s, "\r\n"), times-1))
end

# Create two seperate lists for each column

left = for i <- 0..length(array)-1, is_even(i) do
  Enum.at(array, i)
end

right = for i <- 0..length(array)-1, not is_even(i) do
  Enum.at(array, i)
end

# Sort the lists
left = Enum.sort(left)
right = Enum.sort(right)

diffs = for i <- 0..999 do
  abs(Enum.at(left, i) - Enum.at(right, i))
end

IO.puts(Enum.sum(diffs))


# Part 2
leftFrequencies = Enum.frequencies(left)
rightFrequencies = Enum.frequencies(right)
leftMap = Enum.map(left, fn x -> {x , Map.get(rightFrequencies, x)} end)

simlarities = for l <- Map.keys(leftFrequencies) do
  sharedFreq = elem(List.keyfind(leftMap, l, 0), 1)
  if sharedFreq != nil do
    l * Map.get(leftFrequencies, l) * sharedFreq
  else
    0
  end
end

IO.puts(Enum.sum(simlarities))
