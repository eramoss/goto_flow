defmodule GotoFlow.SelectionSort do
  alias GotoFlow.Helpers
  def sort(list) when is_list(list), do: sort(list, [])

  defp sort([], sorted), do: sorted

  defp sort(list, sorted) do
    max = max(list)
    sort(Helpers.delete(list, max), [max | sorted])
  end

  defp max(list) do
    Helpers.reduce(list, hd(list), fn x, acc -> if x > acc, do: x, else: acc end)
  end
end
