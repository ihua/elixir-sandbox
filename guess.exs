defmodule Chop do
  def guess(actual, range) do
    lo..hi = range
    guess_once(actual, lo..hi)
  end

  def middle(lo, hi) do
    div(lo + hi, 2)
  end

  ## so sad that we can't call middle in guards...:(
  def guess_once(actual, min..max) when is_integer(actual) and div(min + max, 2) > actual do
    IO.puts "is it #{middle(min, max)}???"
    guess_once(actual, min..middle(min, max))
  end
  def guess_once(actual, min..max) when is_integer(actual) and div(min + max, 2) < actual do
    IO.puts "is it #{middle(min, max)}?"
    guess_once(actual, middle(min, max)..max)
  end
  def guess_once(actual, min..max) when is_integer(actual) do
    IO.puts "ah....it is #{middle(min, max)}"
  end
end
