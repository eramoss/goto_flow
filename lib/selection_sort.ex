defmodule GotoFlow.SelectionSort do
  def sort(list) when is_list(list), do: sort(list, [])

  defp sort([], sorted), do: sorted

  defp sort(list, sorted) do
    max = max(list)
    sort(List.delete(list, max), [max | sorted])
  end

  defp max(list) do
    Enum.reduce(list, hd(list), fn x, acc -> if x > acc, do: x, else: acc end)
  end
end
