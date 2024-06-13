defmodule GotoFlow.Helpers do
  def random_list(n) do
    Enum.shuffle(1..n)
  end

  def sorted?(list) do
    list = Enum.zip(list, tl(list))

    Enum.all?(list, fn {a, b} ->
      a <= b
    end)
  end

  @doc """
  Splits a list into two lists based on a function.
  # re-implemented because it is a college project and I can't use Enums complex functions

  ## Examples

  iex> Helpers.split_with([1, 2, 3, 4, 5], fn x -> x < 3 end)
  {[1, 2], [3, 4, 5]}
  """
  def split_with(enumerable, fun) do
    split_with(enumerable, fun, [], [])
  end

  defp split_with([], _fun, trues, falses) do
    {Enum.reverse(trues), Enum.reverse(falses)}
  end

  defp split_with([head | tail], fun, trues, falses) do
    if fun.(head) do
      split_with(tail, fun, [head | trues], falses)
    else
      split_with(tail, fun, trues, [head | falses])
    end
  end

  @doc """
  Splits a list into two lists based on a number.
  # re-implemented because it is a college project and I can't use Enums complex functions

  ## Examples

  iex> Helpers.split_at([1, 2, 3, 4, 5], 2)
  {[1, 2], [3, 4, 5]}
  """
  def split_at(list, n) do
    split_at(list, n, [], [])
  end

  defp split_at([], _n, left, right) do
    {Enum.reverse(left), Enum.reverse(right)}
  end

  defp split_at([head | tail], n, left, right) do
    if n > 0 do
      split_at(tail, n - 1, [head | left], right)
    else
      split_at(tail, n, left, [head | right])
    end
  end

  @doc """
  Filters a list based on a function.
  # re-implemented because it is a college project and I can't use Enums complex functions

  ## Examples

  iex> Helpers.filter([1, 2, 3, 4, 5], fn x -> rem(x, 2) == 0 end)
  [2, 4]
  """
  def filter(list, fun) do
    filter(list, fun, [])
  end

  defp filter([], _fun, acc) do
    Enum.reverse(acc)
  end

  defp filter([head | tail], fun, acc) do
    if fun.(head) do
      filter(tail, fun, [head | acc])
    else
      filter(tail, fun, acc)
    end
  end

  @doc """
  Swaps two elements in a list at given indexes.

  ## Examples

  iex> Helpers.swap([1, 2, 3, 4], 0, 3)
  [4, 2, 3, 1]
  """
  def swap(list, i, j) do
    list
    |> List.replace_at(i, Enum.at(list, j))
    |> List.replace_at(j, Enum.at(list, i))
  end

  @doc """
  Deletes an element from a list at a given value.

  ## Examples

      iex> Helpers.delete([1, 2, 3, 4, 5], 3)
      [1, 2, 4, 5]
  """
  def delete(list, _value) when list == [], do: []

  def delete([head | tail], value) when head == value do
    delete(tail, value)
  end

  def delete([head | tail], value) do
    [head | delete(tail, value)]
  end

  @doc """
  Get minimum value from a list.
  # re-implemented because it is a college project and I can't use Enums complex functions

  ## Examples

  iex> Helpers.min([1, 2, 3, 4, 5])
  1
  """
  def min([head | tail]) do
    minl(tail, head)
  end

  defp minl([], acc) do
    acc
  end

  defp minl([head | tail], acc) when head < acc do
    minl(tail, head)
  end

  defp minl([_head | tail], acc) do
    minl(tail, acc)
  end

  @doc """
  Reduces a list to a single value.
  # re-implemented because it is a college project and I can't use Enums complex functions

  ## Examples

  iex> Helpers.reduce([1, 2, 3, 4, 5], 0, fn x, acc -> x + acc end)
  15
  """
  def reduce([], acc, _fun) do
    acc
  end

  def reduce([head | tail], acc, fun) do
    new_acc = fun.(head, acc)
    reduce(tail, new_acc, fun)
  end
end
