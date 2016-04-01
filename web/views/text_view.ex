defmodule Text.TextView do
  use Text.Web, :view

  def render("index.json", %{texts: texts}) do
    %{data: render_many(texts, Text.TextView, "text.json")}
  end

  def render("show.json", %{text: text}) do
    %{data: render_one(text, Text.TextView, "text.json")}
  end

  def render("text.json", %{text: text}) do
    %{id: text.id,
      title: text.title,
      text: text.text}
  end
end
