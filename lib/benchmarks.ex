defmodule GotoFlow.Benchmarks do
  alias GotoFlow.Helpers
  use Application

  def start(_type, _args) do
    Benchee.run(
      %{
        # "Selection Sort" => fn input -> GotoFlow.selection_sort(input) end,
        "Shell Sort" => fn input -> GotoFlow.shell_sort(input) end,
        "Shell Sort (ciura)" => fn input -> GotoFlow.ShellSortCiura.sort(input) end
        # "Bubble Sort" => fn input -> GotoFlow.bubble_sort(input) end,
        # "Insertion Sort" => fn input -> GotoFlow.insertion_sort(input) end,
        # "Quick Sort" => fn input -> GotoFlow.quick_sort(input) end,
        # "Merge Sort" => fn input -> GotoFlow.merge_sort(input) end,
        # "Elixir sort(merge)" => fn input -> Enum.sort(input) end
      },
      inputs: %{
        "Bigger Random List" => Helpers.random_list(100_000),
        "Medium Random List" => Helpers.random_list(10_000),
        "Small Random List" => Helpers.random_list(1_000),
        "Bigger Sorted List" => Enum.to_list(1..100_000),
        "Medium Sorted List" => Enum.to_list(1..10_000),
        "Small Sorted List" => Enum.to_list(1..1_000),
        "Bigger Reversed List" => Enum.to_list(100_000..1),
        "Medium Reversed List" => Enum.to_list(10_000..1),
        "Small Reversed List" => Enum.to_list(1_000..1)
      },
      formatters: [
        Benchee.Formatters.Console,
        Benchee.Formatters.HTML
      ]
    )

    {:ok, self()}
  end
end
