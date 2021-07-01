defmodule Cats.Cat do
  defstruct [:id, :name, :age]

  def new(%{name: name, age: age}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      age: age
    }
  end
end
