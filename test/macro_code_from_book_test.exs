defmodule MacroCodeFromBookTest do
  use ExUnit.Case
  doctest MacroCodeFromBook

  test "greets the world" do
    assert MacroCodeFromBook.hello() == :world
  end
end
