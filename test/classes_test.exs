defmodule ClassesTest do
  use ExUnit.Case, async: true
  doctest Classes

  test "greets the world" do
    assert Classes.classes() == :world
  end
end
