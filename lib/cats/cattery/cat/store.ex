defmodule Cats.Cattery.Cat.Store do
  use Agent

  alias Cats.Cattery.Cat

  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add(%Cat{} = cat) do
    Agent.update(__MODULE__, fn state -> [cat | state] end)
  end

  def all do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def get(cat_id) do
    Agent.get(__MODULE__, fn state ->
      Enum.find(state, fn cat ->
        cat.id == cat_id
      end)
    end)
  end
end
