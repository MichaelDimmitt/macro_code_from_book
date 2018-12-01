defmodule MathTest do
  use ExUnit.Case
  doctest Math

  require Math
  test "ch1 macro, look at pieces of a quoted expression" do
    assert Math.say(5 + 2) ==
      [result: 7, str: "5 plus 2 is 7"]

    assert Math.say(8 * 4) ==
      [result: 32, str: "8 times 4 is 32"]
  end

  test "ch1 macro, this works too! but 8*4 will already have been evaluated" do
    assert Math.say(8 * 4 + 2) ==
      [result: 34, str: "32 plus 2 is 34"]
  end

end
