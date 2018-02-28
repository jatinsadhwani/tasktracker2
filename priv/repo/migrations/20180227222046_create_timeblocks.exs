defmodule Tasktracker.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :starttime, :time, null: false
      add :endtime, :time, null: false
      add :task_id, references(:tasks, on_delete: :delete_all)

      timestamps()
    end

    create index(:timeblocks, [:task_id])
  end
end
