defmodule Text.TextControllerTest do
  use Text.ConnCase

  alias Text.Text
  @valid_attrs %{text: "some content", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, text_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    text = Repo.insert! %Text{}
    conn = get conn, text_path(conn, :show, text)
    assert json_response(conn, 200)["data"] == %{"id" => text.id,
      "title" => text.title,
      "text" => text.text}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, text_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, text_path(conn, :create), text: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Text, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, text_path(conn, :create), text: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    text = Repo.insert! %Text{}
    conn = put conn, text_path(conn, :update, text), text: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Text, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    text = Repo.insert! %Text{}
    conn = put conn, text_path(conn, :update, text), text: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    text = Repo.insert! %Text{}
    conn = delete conn, text_path(conn, :delete, text)
    assert response(conn, 204)
    refute Repo.get(Text, text.id)
  end
end
