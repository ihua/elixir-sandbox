defmodule FizzBuzz do

  ### more idiomatic
  def upto(n) when n > 0, do: _upto(1, n, [])
  ## anchor case, it's a neat way to stop a recursive function
  defp _upto(_current, 0, result), do: Enum.reverse result
  defp _upto(current, left, result) do
    next_answer = 
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 ->
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 ->
          "Buzz"
        true ->
          current
      end
    _upto(current+1, left-1, [next_answer|result])
  end


  ### use downto
  def upto2(n) when n > 0, do: _downto(n, [])
  defp _downto(0, result), do: result
  defp _downto(current, result) do
    next_answer = 
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 ->
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 ->
          "Buzz"
        true ->
          current
      end
    _downto(current - 1, [next_answer | result])
  end

  ### use string
  def upto3(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
      cond do
        rem(n, 3) == 0 and rem(n, 5) == 0 ->
          "FizzBuzz"
        rem(n, 3) == 0 ->
          "Fizz"
        rem(n, 5) == 0 ->
          "Buzz"
        true ->
          n
      end
  end

  ### use pattern mattching please 
  def upto4(n) when n > 0, do: 1..n |> Enum.map(&_fizzbuzz/1)

  defp _fizzbuzz(n), do: _fizzword(n, rem(n, 3), rem(n, 5))

  defp _fizzword(_n, 0, 0), do: "FizzBuzz"
  defp _fizzword(_n, 0, _), do: "Fizz"
  defp _fizzword(_n, _, 0), do: "Buzz"
  defp _fizzword(n, _, _), do: n

  ### use case
  def upto5(n) when n > 0, do: 1..n |> Enum.map(&_fizzbuzz_case/1)
  defp _fizzbuzz_case(n) do
    case {n, rem(n, 3), rem(n, 5)} do
      {_n, 0, 0} ->
        "FizzBuzz"
      {_n, 0, _} ->
        "Fizz"
      {_n, _, 0} ->
        "Buzz"
      _ ->
        n
    end
  end

  def ok!(arg) do
    case arg do
      {:ok, data} ->
        data
        |> IO.stream(:line)
        |> Enum.map(fn w -> IO.write "#{w}" end)
      {:error, reason} ->
        raise "Failed: #{reason}"
      _ ->
        raise "error"
    end
  end
end

