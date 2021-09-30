# Classes

Pure function for generating CSS classes. Inspired by the popular
[classnames](https://www.npmjs.com/package/classnames) Javascript library.

## Installation

Install by adding `classes` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:classes, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
Classes.classes(yes: true, no: false) # => "yes"
```

[See the docs for more examples](https://hexdocs.pm/classes/Classes.html#classes/0).

## Suggested Phoenix installation

You can call `classes` just like any other function, but if you're using Phoenix then I suggest
importing it with your view helpers:

```elixir
defmodule MyAppWeb do
  ...

  defp view_helpers do
    quote do
      ...

      import Classes
    end
  end
end
```

This way you can call it from any template like:

```eex
<%# In your .heex template %>
<div class={classes("my-class": true, "not-me": false)}>...</div>
```
