defmodule SocialNetworkElixirWeb.PageController do
  use SocialNetworkElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
