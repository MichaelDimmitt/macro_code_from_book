defmodule MacroCodeFromBookTest do
  use ExUnit.Case
  doctest MacroCodeFromBook

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

  require ControlFlow
  test "ch1 macro, recreating the unless macro" do
    assert ControlFlow.unless 2 == 5, do: "block entered" ==
      "block entered"
  end

  test "ch1 fail to inject into the ast, since missing 'unquote'" do
    # https://elixirforum.com/t/how-to-test-a-compile-error/15626/2
    assert_raise CompileError, "nofile:1: undefined function number/0", fn() ->
      ast = quote do
        number() * 10
      end
      Code.eval_quoted ast
    end
  end

  test "ch1 inject values into the ast with unquote" do
    ## this is not a macro file but an iex example in the book page13
    number = 5

    ast = quote do
      number * 10
    end

    asty = quote do
      unquote(number) * 10
    end

    assert [
      ast: ast,
      asty: asty,
      eval_asty: Code.eval_quoted asty
    ] ==
    [
      ast: {:*, [context: MacroCodeFromBookTest, import: Kernel],
      [{:number, [], MacroCodeFromBookTest}, 10]},
        asty: {:*, [context: MacroCodeFromBookTest, import: Kernel], [5, 10]},
        eval_asty: {50, []}
    ]
  end

end

