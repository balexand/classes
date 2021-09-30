defmodule Classes do
  @moduledoc """
  A pure function for generating CSS classes.
  """

  @doc """
  Returns a string containing CSS. The argument can be any of the following:

    * String or atom containing a CSS class or classes.
    * Keyword list or map with string or atom keys. The key is a CSS class and the value is
      treated as a boolean indicating whether or not the class should be included.
    * `nil` and `false` are filtered.
    * Lists, including deeply nested lists, containing any of the above types.

  ## Examples

      iex> classes("my-class")
      "my-class"

      iex> classes(:myclass)
      "myclass"

      iex> classes(["one", :two])
      "one two"

      iex> classes(yes: true, no: false)
      "yes"

      iex> classes(%{"string-key" => true, "atom-key": true})

      iex> classes(yes: "I'm truthy", no: nil)
      "yes"

      iex> classes([%{"one" => true}, [two: false, three: true]])
      "one three"

      iex> classes([{"string-key-tuple", true}, {"also-happens-to_work", nil}])
      "string-key-tuple"

      iex> classes([[[nil, false, "hello", :world]]])
      "hello world"

      iex> classes([{"invalid argument"}])
      ** (FunctionClauseError) no function clause matching in Classes.class_list/1
  """
  def classes(class) do
    [class]
    |> List.flatten()
    |> Enum.flat_map(&class_list/1)
    |> Enum.join(" ")
  end

  defguardp is_class(c) when is_binary(c) or is_atom(c)

  # Returns list of strings and atoms
  defp class_list(false), do: []
  defp class_list(nil), do: []
  defp class_list(s) when is_class(s), do: [s]
  defp class_list({k, false}) when is_class(k), do: []
  defp class_list({k, nil}) when is_class(k), do: []
  defp class_list({k, _}) when is_class(k), do: [k]
  defp class_list(%{} = map), do: Enum.flat_map(map, &class_list/1)
end
