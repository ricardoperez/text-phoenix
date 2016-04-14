defmodule Text.Text do
  use Text.Web, :model

  schema "texts" do
    field :title, :string
    field :text, :string

    timestamps
  end

  @required_fields ~w(title text)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:title, min: 5)
    |> validate_length(:title, max: 30)
  end
end
