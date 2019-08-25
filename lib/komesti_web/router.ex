defmodule KomestiWeb.Router do
  use KomestiWeb, :router

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

  scope "/api", KomestiWeb do
    pipe_through :api

    resources "/eateries", EateryController, except: [:new, :edit], param: "slug" do
      resources "/hours", HourController, except: [:new, :edit]
    end
  end

  scope "/", KomestiWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", KomestiWeb do
  #   pipe_through :api
  # end
end
