defmodule UnlessTest do
  use ExUnit.Case
  doctest ControlFlow
  require ControlFlow

  test "ch1 macro, recreating the unless macro" do
    assert ControlFlow.unless 2 == 5, do: "block entered" ==
      "block entered"
  end

  test "ch1 macro, unless macro, refute to test nil and false" do
    refute ControlFlow.unless (2 == 2), do: "block entered"
  end
end
