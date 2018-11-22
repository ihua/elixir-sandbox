defmodule SpawnBasic do
  def greet do
    IO.puts "Hello"
  end

  def greet1 do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
    end
  end

  def client do
    pid = spawn(SpawnBasic, :greet1, [])
    send pid, {self(), "world!"}

    receive do
      {:ok, message} ->
        IO.puts message
    after 500 ->
        IO.puts "The greeter has gone away"
    end
  end


end
