defmodule GotoFlow.ShellSort do
  def sort(list) when is_list(list) do
    n = length(list)
    h = h_value(n)
    sort(list, h)
  end

  defp sort(list, h) do
    if h == 1, do: insertion_sort(list), else: sort(list, h - 1)
  end

  defp insertion_sort(list) do
    insert_iter(list, [])
  end

  defp insert_iter([], sorted), do: sorted

  defp insert_iter([h | t], sorted) do
    insert_iter(t, insert(h, sorted))
  end

  defp insert(h, []), do: [h]
  defp insert(h, [h2 | t]) when h <= h2, do: [h | [h2 | t]]
  defp insert(h, [h2 | t]), do: [h2 | insert(h, t)]

  defp h_value(n) do
    Enum.reduce(1..n, 1, fn x, _ -> 3 * x + 1 end)
  end
end
