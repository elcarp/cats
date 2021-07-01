defmodule Cats.Cat do
  defstruct [:name, :age, :breed]

  def new(%{name: name, age: age, breed: breed}) do
    %__MODULE__{
      name: name,
      age: age,
      breed: breed
    }
  end
end
