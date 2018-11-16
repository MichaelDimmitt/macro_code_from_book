defmodule Mix.Tasks.All do
  use Mix.Task

  @shortdoc "Simply runs the Hello.say/0 function"
  def run(_) do
    # calling our Hello.say() function from earlier
    ch1_math()
    ch1_cf()
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
  end

end
