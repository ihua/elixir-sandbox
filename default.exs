defmodule DefaultParams1 do
  def func(p1, p2 \\ 123)
  def func(p1, p2) when is_list(p1) do
    "you said #{p2} with a list"
  end

  def func(p1, p2) do
    "you passed in #{p1} and #{p2}"
  end
end
