defmodule BloggerdayWeb.TailwindHelper do
  use Phoenix.HTML
  import BloggerdayWeb.ErrorHelpers

  def tailwind_error_tag(form, field) do
    Enum.map(Keyword.get_values(form.errors, field), fn error ->
      content_tag(:p, translate_error(error),
        class: "mt-2 text-sm text-red-500",
        phx_feedback_for: input_name(form, field)
      )
    end)
  end

  def gravatar_url(email) do
    hash =
      email
      |> String.trim()
      |> String.downcase()
      |> :erlang.md5()
      |> Base.encode16(case: :lower)

    "https://www.gravatar.com/avatar/#{hash}?s=150&d=identicon"
  end

  def initial_plus_last_name(user) do
    case {user.first_name, user.last_name} do
      {nil, nil} ->
        ""

      {"", ""} ->
        ""

      {first_name, last_name} ->
        truncate("#{String.at(user.first_name, 0)}. #{user.last_name}", length: 25)

      {_, _} ->
        ""
    end
  end

  # Copied from https://github.com/ikeikeikeike/phoenix_html_simplified_helpers
  def truncate(text, options \\ []) do
    len = options[:length] || 30
    omi = options[:omission] || "..."

    cond do
      !String.valid?(text) ->
        text

      String.length(text) < len ->
        text

      true ->
        len_with_omi = len - String.length(omi)

        stop =
          if options[:separator] do
            rindex(text, options[:separator], len_with_omi) || len_with_omi
          else
            len_with_omi
          end

        "#{String.slice(text, 0, stop)}#{omi}"
    end
  end

  defp rindex(text, str, offset) do
    text =
      if offset do
        String.slice(text, 0, offset)
      else
        text
      end

    revesed = text |> String.reverse()
    matchword = String.reverse(str)

    case :binary.match(revesed, matchword) do
      {at, strlen} ->
        String.length(text) - at - strlen

      :nomatch ->
        nil
    end
  end
end
