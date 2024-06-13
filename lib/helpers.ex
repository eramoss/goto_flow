defmodule GotoFlow.Helpers do
  def random_list(n) do
    Enum.shuffle(1..n)
  end
end
