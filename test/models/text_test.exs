defmodule Text.TextTest do
  use Text.ModelCase

  alias Text.Text

  @valid_attrs %{text: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Text.changeset(%Text{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Text.changeset(%Text{}, @invalid_attrs)
    refute changeset.valid?
  end
end
