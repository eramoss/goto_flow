defmodule GotoFlow.QuickSort do
  def sort([]), do: []

  def sort([h | t]) do
    {lesser, greater} = partition(t, h)
    sort(lesser) ++ [h] ++ sort(greater)
  end

  @doc """
  Split a list into two parts: one with elements less than or equal to the pivot
  # re-implemented because it is a college project and i cant use Enums complex functions

  ## Examples

      iex> GotoFlow.QuickSort.partition([3, 2, 1], 2)
      {[1], [3]}
  """
  def partition([], _pivot), do: {[], []}

  def partition([h | t], pivot) do
    {lesser, greater} = partition(t, pivot)

    if h <= pivot do
      {[h | lesser], greater}
    else
      {lesser, [h | greater]}
    end
  end
end
