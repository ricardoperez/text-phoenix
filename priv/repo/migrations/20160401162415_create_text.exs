defmodule Text.Repo.Migrations.CreateText do
  use Ecto.Migration

  def change do
    create table(:texts) do
      add :title, :string
      add :text, :text

      timestamps
    end

  end
end
