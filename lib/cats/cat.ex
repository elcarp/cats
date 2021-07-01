defmodule Cats.Cat do
  use Agent
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, fn value -> value end)
  end

  def deposit(by \\ 1) do
    Agent.update(__MODULE__, fn value -> value + by end)
  end

  def withdrawal(by \\ 1) do
    Agent.update(__MODULE__, fn value -> value - by end)
  end
end
