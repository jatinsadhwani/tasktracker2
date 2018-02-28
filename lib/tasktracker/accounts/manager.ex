defmodule Tasktracker.Accounts.Manager do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Accounts.Manager


  schema "manager" do
    belongs_to :manages, Tasktracker.Accounts.User
    belongs_to :managee, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Manager{} = manager, attrs) do
    manager
    |> cast(attrs, [:manages_id, :managee_id])
    |> validate_required([:manages_id, :managee_id])
  end
end
