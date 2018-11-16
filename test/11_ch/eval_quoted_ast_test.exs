defmodule EvalQuotedAst do
  use ExUnit.Case

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
      ast: {:*, [context: EvalQuotedAst, import: Kernel],
      [{:number, [], EvalQuotedAst}, 10]},
        asty: {:*, [context: EvalQuotedAst, import: Kernel], [5, 10]},
        eval_asty: {50, []}
    ]
  end

end

