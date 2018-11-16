defmodule Canvas do

  @defaults [ fg: "black", bg: "white", font: "Merriweather"]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts "Drawing text\t#{inspect(text)}"
    IO.puts "Foreground: \t#{options[:fg]}"
    IO.puts "Background: \t#{Keyword.get(options, :bg)}"
    IO.puts "Font:       \t#{Keyword.get(options, :font)}"
    IO.puts "Pattern:    \t#{Keyword.get(options, :pattern, "solid")}"
    IO.puts "Style:      \t#{inspect Keyword.get_values(options, :style)}"
  end
end
