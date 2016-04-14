defmodule Text.PageController do
  use Text.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn,  %{"messenger" => messenger}) do
    render conn, "message.html", messenger: messenger
  end

  def hello(conn, _params) do
    render conn, "hello.html", pou: "charmander"
  end

end
