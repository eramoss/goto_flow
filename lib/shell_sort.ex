defmodule GotoFlow.ShellSort do
  alias GotoFlow.InsertionSort
  alias GotoFlow.Helpers
  def sort(list) when length(list) <= 1, do: list
  def sort(list), do: sort(list, div(length(list), 2))

  defp sort(list, inc) do
    groups_to_sort_in_pieces =
      Enum.with_index(list) |> Enum.group_by(fn {_, i} -> rem(i, inc) end)

    weak_sorted =
      Enum.map(0..(inc - 1), fn i ->
        # maps the groups to sort in pieces and sorts them with insertion sort
        # and then merges them into the list again
        Enum.map(groups_to_sort_in_pieces[i], fn {x, _} -> x end) |> InsertionSort.insert_iter([])
      end)
      |> merge

    if Helpers.sorted?(weak_sorted),
      do: weak_sorted,
      else: sort(weak_sorted, max(trunc(inc / 2.2), 1))
  end

  # Takes a list of lists and merges them into one list
  # The lists are "pre-sorted"
  # The merges rule is that the first element of the first list is the smallest
  defp merge(lists) do
    len = length(hd(lists))

    Enum.map(lists, fn list -> if length(list) < len, do: list ++ [nil], else: list end)
    |> List.zip()
    |> Enum.flat_map(fn tuple -> Tuple.to_list(tuple) end)
    |> Enum.filter(& &1)
  end
end
