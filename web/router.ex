defmodule Text.Router do
  use Text.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Text do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", PageController, :hello
    get "/hello/:messenger", PageController, :hello
  end


  # Other scopes may use custom stacks.
  scope "/api", Text do
    pipe_through :api
    resources "/texts", TextController, except: [:new, :edit]
  end
end
