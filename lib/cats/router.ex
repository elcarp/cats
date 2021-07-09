defmodule Cats.Router do
  use Plug.Router
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)

  plug(:match)
  plug(:dispatch)

  get "/cats" do
    cats = Cats.Cattery.Cat.Store.all()

    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, Jason.encode!(cats))
  end
end
