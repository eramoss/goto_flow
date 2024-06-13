defmodule GotoFlow.MergeSort do
  def sort(list) when length(list) <= 1, do: list

  def sort(list) do
    {left, right} = split(list, div(length(list), 2))
    merge(sort(left), sort(right))
  end

  defp merge([], right), do: right
  defp merge(left, []), do: left
  defp merge([h1 | t1], [h2 | _] = r) when h1 <= h2, do: [h1 | merge(t1, r)]
  defp merge(l, [h2 | t2]), do: [h2 | merge(l, t2)]

  defp split(list, at) do
    {Enum.take(list, at), Enum.drop(list, at)}
  end
end
