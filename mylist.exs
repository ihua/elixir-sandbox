defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head*head | square(tail)]

  def map([], _fun), do: []
  def map([head|tail], fun), do: [fun.(head) | map(tail, fun)]

  def reduce([], value, _fun), do: value
  def reduce([head|tail], value, fun), do: reduce(tail, fun.(head, value), fun) 

  def mapsum([], _fun), do: []
  def mapsum(list, fun) when is_list(list) do
    list
    |> map(fun)
    |> reduce(0, &(&1 + &2))
  end

  import Kernel, except: [max: 1, max: 2]
  def max([head|tail]) do
    max(head, tail)
  end
  defp max(current, []), do: current
  defp max(current, [head|tail]) when current < head do
    max(head, tail)
  end
  defp max(current, [_|tail]), do: max(current, tail)

  def swap([]), do: []
  def swap([a, b| tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise "can't swap a list with an odd number of elements"

  def span(from, to) do
    span(from, to, [])
  end
  defp span(from, to, _list) when from > to, do: []
  defp span(from, to, list) when from == to, do: list ++ [to]
  defp span(from, to, list) do
    list ++ [from | span(from + 1, to, list)]
  end

  def all?([], _fun), do: true
  def all?(enumerable, fun) do
    reduce(enumerable, true, fn x, _ ->
      if fun.(x), do: true, else: false
    end)
  end

  def each(enumerable, fun) do
    map(enumerable, fun)
  end

  def filter([head | tail], fun) do
    if(fun.(head)) do
      [head | filter(tail, fun) ]
    else
      filter(tail, fun)
    end
  end
  def filter([], _fun) do
    []
  end

  ## TODO: split
  
  def take([head|tail], count) when count > 0 do
    [head|take(tail, count - 1)]
  end
  def take(enumerable, count) when count >= length(enumerable) do
    []
  end

  ## TODO: flatten
  def flatten(enumerable) when is_list(enumerable) do
  end

  ## TODO: question: why I can't use my all? function here?
  def prime(n) when is_integer(n) and n > 0 do
    for x <- span(2, n), Enum.all?(span(2, x - 1), fn d -> rem(x, d) != 0 end), do: x
  end

  ## Exercise ListAndRecursion-8
  tax_rates = [NC: 0.075, TX: 0.08 ]
  orders = [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount: 35.50 ],
    [ id: 125, ship_to: :TX, net_amount: 24.00 ],
    [ id: 126, ship_to: :TX, net_amount: 44.80 ],
    [ id: 127, ship_to: :NC, net_amount: 25.00 ],
    [ id: 128, ship_to: :MA, net_amount: 10.00 ],
    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
    [ id: 130, ship_to: :NC, net_amount: 50.00 ]
  ]


end
