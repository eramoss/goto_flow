defmodule GotoFlow.BubbleSort do
  def sort(list) when is_list(list) do
    t = bsort_iter(list)

    if t == list, do: t, else: sort(t)
  end

  defp bsort_iter([x, y | t]) when x > y, do: [y | bsort_iter([x | t])]
  defp bsort_iter([x, y | t]), do: [x | bsort_iter([y | t])]
  defp bsort_iter(list), do: list
end
