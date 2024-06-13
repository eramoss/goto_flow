defmodule GotoFlow do
  @moduledoc """
  Sorting algorithms implemented in Elixir.
  """
  alias GotoFlow.SelectionSort
  alias GotoFlow.BubbleSort
  alias GotoFlow.InsertionSort
  alias GotoFlow.QuickSort
  alias GotoFlow.MergeSort
  alias GotoFlow.ShellSort

  @doc """
  Sort a list of integers using the bubble sort algorithm.

  ## Examples

      iex> GotoFlow.bubble_sort([3, 2, 1])
      [1, 2, 3]
  """
  def bubble_sort(list) do
    BubbleSort.sort(list)
  end

  @doc """
  Sort a list of integers using the selection sort algorithm.

  ## Examples

      iex> GotoFlow.selection_sort([3, 2, 1])
      [1, 2, 3]
  """
  def selection_sort(list) do
    SelectionSort.sort(list)
  end

  @doc """
  Sort a list of integers using the insertion sort algorithm.

  ## Examples

      iex> GotoFlow.insertion_sort([3, 2, 1])
      [1, 2, 3]
  """
  def insertion_sort(list) do
    InsertionSort.sort(list)
  end

  @doc """
  Sort a list of integers using the quick sort algorithm.

  ## Examples

      iex> GotoFlow.quick_sort([3, 2, 1])
      [1, 2, 3]
  """
  def quick_sort(list) do
    QuickSort.sort(list)
  end

  @doc """
  Sort a list of integers using the merge sort algorithm.

  ## Examples

      iex> GotoFlow.merge_sort([3, 2, 1])
      [1, 2, 3]
  """
  def merge_sort(list) do
    MergeSort.sort(list)
  end

  @doc """
  Sort a list of integers using the shell sort algorithm.

  ## Examples

      iex> GotoFlow.shell_sort([3, 2, 1])
      [1, 2, 3]
  """
  def shell_sort(list) do
    ShellSort.sort(list)
  end
end
