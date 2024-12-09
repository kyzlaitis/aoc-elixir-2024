defmodule Day2.Day2 do
  def safe_reports do
    "lib/day2/day2.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_report/1)
    |> Enum.filter(&is_safe?/1)
    |> Enum.count()
  end

  def parse_report(item) do
    item
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def is_safe?(levels) do
    is_increasing?(levels) or is_decreasing?(levels)
  end

  defp is_increasing?([]), do: true
  defp is_increasing?([_]), do: true
  defp is_increasing?([a, b | rest]) when b > a and abs(b - a) in 1..3 do
    is_increasing?([b | rest])
  end
  defp is_increasing?(_), do: false

  defp is_decreasing?([]), do: true
  defp is_decreasing?([_]), do: true
  defp is_decreasing?([a, b | rest]) when a > b and abs(a - b) in 1..3 do
    is_decreasing?([b | rest])
  end
  defp is_decreasing?(_), do: false
end
