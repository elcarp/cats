defmodule Cats.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Cats.Cattery.Cat.Store,
      {Plug.Cowboy, scheme: :http, plug: Cats.Router, options: [port: 4040]}

      # Starts a worker by calling: Stateful.Worker.start_link(arg)
      # {Stateful.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cats.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
