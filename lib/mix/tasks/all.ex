defmodule Mix.Tasks.All do
  use Mix.Task

  @shortdoc "Simply runs the Hello.say/0 function"
  def run(_) do
    # calling our Hello.say() function from earlier
    ch1_math()
    ch1_cf()

    code_eval_example()
  end

  require Math
  def ch1_math() do
    Math.say(5 + 2)
    |> IO.inspect()

    Math.say(8 * 4)
    |> IO.inspect()

    Math.say(8 * 4 + 2)
    |> IO.inspect()
  end

  require ControlFlow
  def ch1_cf() do
    ControlFlow.unless 2 == 5, do: "block entered"
    |> IO.inspect()

    ControlFlow.unless !(2 == 5), do: "block entered"
    |> IO.inspect() # this returns nil
  end

  def code_eval_example() do
    ## this is not a macro file but an iex example in the book page13
    number = 5
    |> IO.inspect

    ast = quote do
      number * 10
    end
    asty = quote do
      unquote(number) * 10
    end
    [
      ast: ast,
      asty: asty,
      eval_asty: Code.eval_quoted asty
    ]
    |> IO.inspect
  end

end
