defmodule BloggerdayWeb.PageLiveTest do
  use BloggerdayWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Dein Blog ist Deine"
    assert render(page_live) =~ "Dein Blog ist Deine"
  end
end
