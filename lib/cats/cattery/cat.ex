defmodule Cats.Cattery.Cat do
  defstruct [:id, :name, :age, :breed]

  def new(%{name: name, age: age, breed: breed}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      age: age,
      breed: breed
    }
  end
end
