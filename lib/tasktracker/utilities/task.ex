defmodule Tasktracker.Utilities.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Utilities.Task
  alias Tasktracker.Utilities.Time


  schema "tasks" do
    field :description, :string
    field :status, :boolean, default: false
    field :title, :string
    belongs_to :user, Tasktracker.Accounts.User

    has_many :task_time_id, Time, foreign_key: :task_id
    has_many :starttime, through: [:task_time_id, :starttime]
    has_many :endtime, through: [:task_time_id, :endtime]

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :user_id])
    |> validate_required([:title, :description, :status, :user_id])
  end
end
