defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Utilities
  alias Tasktracker.Utilities.Task
  alias Tasktracker.Accounts.Manager


  def index(conn, _params) do
    render conn, "index.html"
  end

  def task(conn, _params) do
    times = Tasktracker.Utilities.list_timeblocks()
    current_user = conn.assigns[:current_user]
    new_task = %Task{}
    employees = Tasktracker.Accounts.get_my_employees(current_user.id)
    changeset = Utilities.change_task(new_task)
    manager = Tasktracker.Accounts.get_my_manager(current_user.id)
    tasks = Utilities.list_tasks()
    render conn, "task.html", tasks: tasks, manager: manager, changeset: changeset, employees: employees, times: times
  end

  def profile(conn, _params) do
    current_user = conn.assigns[:current_user]
    new_task = %Task{}
    changeset = Utilities.change_task(new_task)
    employees = Tasktracker.Accounts.get_my_employees(current_user.id)
    tasks = Utilities.list_tasks()
    render conn, "profile.html", employees: employees, tasks: tasks, changeset: changeset, value: :jatin
  end
end
