defmodule Mix.Tasks.All do
  use Mix.Task
  require Math

  @shortdoc "Simply runs the Hello.say/0 function"
  def run(_) do
    # calling our Hello.say() function from earlier
    ch1()
  end

  def ch1 do
    Math.say(5 + 2)
    |> IO.inspect()

    Math.say(8 * 4)
    |> IO.inspect()

    Math.say(8 * 4 + 2)
    |> IO.inspect()
  end
end
