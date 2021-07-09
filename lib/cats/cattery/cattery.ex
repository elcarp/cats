defmodule Cats.Cattery do
  alias __MODULE__.Cat

  defdelegate new_cat(params),
    to: Cat,
    as: :new

  defdelegate all_cats,
    to: Cat.Store,
    as: :all

  defdelegate get_cat(cat_id),
    to: Cat.Store,
    as: :get

  defdelegate store_cat(cat),
    to: Cat.Store,
    as: :add
end
