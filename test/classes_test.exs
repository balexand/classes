defmodule ClassesTest do
  use ExUnit.Case
  doctest Classes

  test "greets the world" do
    assert Classes.hello() == :world
  end
end
