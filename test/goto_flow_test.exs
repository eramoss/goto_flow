defmodule GotoFlowTest do
  alias GotoFlow.Helpers
  use ExUnit.Case
  doctest GotoFlow

  test "SelectionSort/1 should sort a big list" do
    list = Helpers.random_list(10_000)
    assert GotoFlow.SelectionSort.sort(list) == Enum.sort(list)
  end

  test "BubbleSort/1 should sort a big list" do
    list = Helpers.random_list(10_000)
    assert GotoFlow.BubbleSort.sort(list) == Enum.sort(list)
  end

  test "InsertionSort/1 should sort a big list" do
    list = Helpers.random_list(10_000)
    assert GotoFlow.InsertionSort.sort(list) == Enum.sort(list)
  end

  test "QuickSort/1 should sort a big list" do
    list = Helpers.random_list(10_000)
    assert GotoFlow.QuickSort.sort(list) == Enum.sort(list)
  end

  test "MergeSort/1 should sort a big list" do
    list = Helpers.random_list(10_000)
    assert GotoFlow.MergeSort.sort(list) == Enum.sort(list)
  end

  test "ShellSort/1 should sort a big list" do
    list = Helpers.random_list(10_000)
    assert GotoFlow.ShellSort.sort(list) == Enum.sort(list)
  end
end
