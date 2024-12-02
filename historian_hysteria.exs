import Integer

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

diffs = for i <- 0..999 do
  abs(Enum.at(left, i) - Enum.at(right, i))
end

IO.puts(Enum.sum(diffs))
