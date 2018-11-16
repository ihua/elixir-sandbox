defmodule MyString do

  def isAlpha?(string) do
  end

  def anagrams(a, b) do
  end

  def calculate(string) do
  end

  def each(str, func), do: _each(String.next_codepoint(str), func)
  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end
  defp _each(nil, _), do: []

  def center do
  end

end
