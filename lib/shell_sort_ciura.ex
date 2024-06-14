defmodule GotoFlow.ShellSortCiura do
  alias GotoFlow.InsertionSort
  alias GotoFlow.Helpers
  def sort(list) when length(list) <= 1, do: list

  def sort(list) do
    ciura_gaps = [701, 301, 132, 57, 23, 10, 4, 1]
    sort(list, ciura_gaps)
  end

  defp sort(list, [g | gaps]) do
    groups_to_sort_in_pieces =
      Enum.with_index(list) |> Enum.group_by(fn {_, i} -> rem(i, g) end)

    weak_sorted =
      Enum.map(0..(g - 1), fn i ->
        # maps the groups to sort in pieces and sorts them with insertion sort
        # and then merges them into the list again
        group_to_sort = groups_to_sort_in_pieces[i]

        if is_nil(group_to_sort),
          do: list,
          else:
            Enum.map(groups_to_sort_in_pieces[i], fn {x, _} -> x end)
            |> InsertionSort.insert_iter([])
      end)
      |> merge

    if Helpers.sorted?(weak_sorted),
      do: weak_sorted,
      else: sort(weak_sorted, gaps)
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
