defmodule Tasktracker.Utilities.Time do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Utilities.Time


  schema "timeblocks" do
    field :endtime, :time
    field :starttime, :time
    belongs_to :task, Tasktracker.Utilities.Task

    timestamps()
  end

  @doc false
  def changeset(%Time{} = time, attrs) do
    time
    |> cast(attrs, [:starttime, :endtime, :task_id])
    |> validate_required([:starttime, :endtime, :task_id])
  end
end
