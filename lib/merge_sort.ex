defmodule GotoFlow.MergeSort do
  alias GotoFlow.Helpers

  def sort(list) do
    {left, right} = Helpers.split_at(list, div(length(list), 2))
    merge(sort(left, length(left)), sort(right, length(right)))
  end

  defp sort(list, 1), do: list

  defp sort(list, n) do
    {left, right} = Helpers.split_at(list, div(n, 2))
    merge(sort(left, length(left)), sort(right, length(right)))
  end

  defp merge([], right), do: right
  defp merge(left, []), do: left

  defp merge([l | left], [r | right]) when l <= r do
    [l | merge(left, [r | right])]
  end

  defp merge([l | left], [r | right]) when l > r do
    [r | merge([l | left], right)]
  end
end
