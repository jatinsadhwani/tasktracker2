defmodule TasktrackerWeb.TimeView do
  use TasktrackerWeb, :view
  alias TasktrackerWeb.TimeView

  def render("index.json", %{timeblocks: timeblocks}) do
    %{data: render_many(timeblocks, TimeView, "time.json")}
  end

  def render("show.json", %{time: time}) do
    %{data: render_one(time, TimeView, "time.json")}
  end

  def render("time.json", %{time: time}) do
    %{id: time.id,
      starttime: time.starttime,
      endtime: time.endtime}
  end
end
