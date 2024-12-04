defmodule Day1 do
  def day_one_distance() do

    {:ok, content} = File.read("lib/day1.txt");
    lines = String.split(content, "\n")

    list = Enum.map(lines, &split_line(&1))

    left_list = Enum.map(list, fn x -> Enum.at(x, 0) end)
    right_list = Enum.map(list, fn x -> Enum.at(x, 1) end)

    left_list = Enum.sort(left_list);
    right_list = Enum.sort(right_list);

    zipped = Enum.zip(left_list, right_list)

    Enum.map(zipped, fn {left, right}-> Day1.get_distante(left, right) end) |> Enum.sum()
  end

  def split_line(line) do
    String.split(line, ~r/\s+/)
  end

  def get_distante(left, right) do
    abs(String.to_integer(left) - String.to_integer(right))
  end


end
