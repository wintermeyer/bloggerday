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
end
