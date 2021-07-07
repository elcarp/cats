defmodule Cats.Cattery.Cat do
  @derive Jason.Encoder
  defstruct [:id, :name, :age, :breed]

  defmodule Store do
    use Cats.Storage.Base, module: Cats.Cattery.Cat
  end

  def new(%{name: name, age: age, breed: breed}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      age: age,
      breed: breed
    }
  end
end
