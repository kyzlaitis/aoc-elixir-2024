defmodule Day1 do
  def day_one_distance() do

    "lib/day1.txt"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(&parse_string/1)
      |> Enum.unzip()
      |> compute_total_distance

  end

  def compute_total_distance({left_list, right_list}) do
    left_list = Enum.sort(left_list)
    right_list = Enum.sort(right_list)

    Enum.zip(left_list, right_list)
    |> Enum.map(fn {left_value, right_value} -> abs(left_value - right_value) end)
    |> Enum.sum()
  end

  def parse_string(distance_raw) do
    [left, right] = String.split(distance_raw)
    {String.to_integer(left), String.to_integer(right)}
  end

end
