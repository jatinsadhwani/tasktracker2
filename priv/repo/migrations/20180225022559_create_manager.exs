defmodule Tasktracker.Repo.Migrations.CreateManager do
  use Ecto.Migration

  def change do
    create table(:manager) do
      add :manages_id, references(:users, on_delete: :delete_all), null: false
      add :managee_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:manager, [:manages_id])
    create index(:manager, [:managee_id])
  end
end
