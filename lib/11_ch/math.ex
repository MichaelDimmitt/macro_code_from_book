# ---
# Excerpted from "Metaprogramming Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/cmelixir for more book information.
# ---
defmodule Math do
  # {:+, [context: Elixir, import: Kernel], [5, 2]}
  defmacro say({:+, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs + rhs

      [ result: result,
        str: "#{lhs} plus #{rhs} is #{result}"]
    end
  end

  # {:*, [context: Elixir, import: Kernel], [8, 3]}
  defmacro say({:*, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs * rhs
      [ result: result,
        str: "#{lhs} times #{rhs} is #{result}"]
    end
  end
end

# lib/calculation_machine.ex
defmodule MathRunStuff do
  def interface() do
    require Math
    Math.say(5 + 2)
    Math.say(8 * 4)
    Math.say(8 * 4 +2)
  end
end

# MathRunStuff.interface
