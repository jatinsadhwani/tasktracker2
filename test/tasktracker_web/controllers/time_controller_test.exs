defmodule TasktrackerWeb.TimeControllerTest do
  use TasktrackerWeb.ConnCase

  alias Tasktracker.Utilities
  alias Tasktracker.Utilities.Time

  @create_attrs %{endtime: ~T[14:00:00.000000], starttime: ~T[14:00:00.000000]}
  @update_attrs %{endtime: ~T[15:01:01.000000], starttime: ~T[15:01:01.000000]}
  @invalid_attrs %{endtime: nil, starttime: nil}

  def fixture(:time) do
    {:ok, time} = Utilities.create_time(@create_attrs)
    time
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all timeblocks", %{conn: conn} do
      conn = get conn, time_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create time" do
    test "renders time when data is valid", %{conn: conn} do
      conn = post conn, time_path(conn, :create), time: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, time_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "endtime" => ~T[14:00:00.000000],
        "starttime" => ~T[14:00:00.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, time_path(conn, :create), time: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update time" do
    setup [:create_time]

    test "renders time when data is valid", %{conn: conn, time: %Time{id: id} = time} do
      conn = put conn, time_path(conn, :update, time), time: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, time_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "endtime" => ~T[15:01:01.000000],
        "starttime" => ~T[15:01:01.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn, time: time} do
      conn = put conn, time_path(conn, :update, time), time: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete time" do
    setup [:create_time]

    test "deletes chosen time", %{conn: conn, time: time} do
      conn = delete conn, time_path(conn, :delete, time)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, time_path(conn, :show, time)
      end
    end
  end

  defp create_time(_) do
    time = fixture(:time)
    {:ok, time: time}
  end
end
