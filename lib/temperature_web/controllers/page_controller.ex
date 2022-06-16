defmodule TemperatureWeb.PageController do
  use TemperatureWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
