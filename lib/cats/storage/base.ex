defmodule Cats.Storage.Base do
  defmacro __using__(options) do
    module = Keyword.get(options, :module)

    quote do
      use Agent

      def start_link(_) do
        Agent.start_link(fn -> [] end, name: __MODULE__)
      end

      def add(%unquote(module){id: resource_id} = resource) do
        case get(resource_id) do
          nil ->
            Agent.update(__MODULE__, fn state -> [resource | state] end)

          %unquote(module){} ->
            {:error, :already_exists}
        end
      end

      def all do
        Agent.get(__MODULE__, fn state -> state end)
      end

      def get(resource_id) do
        Agent.get(__MODULE__, fn state ->
          Enum.find(state, fn resource ->
            resource.id == resource_id
          end)
        end)
      end
    end
  end
end
