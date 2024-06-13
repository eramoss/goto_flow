defmodule GotoFlow.InsertionSort do
  def sort(list) do
    insert_iter(list, [])
  end

  defp insert_iter([], sorted), do: sorted

  defp insert_iter([h | t], sorted) do
    insert_iter(t, insert(h, sorted))
  end

  defp insert(h, []), do: [h]
  defp insert(h, [h2 | t]) when h <= h2, do: [h | [h2 | t]]
  defp insert(h, [h2 | t]), do: [h2 | insert(h, t)]
end
