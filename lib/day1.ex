defmodule Day1 do
  def day_one_distance() do

    {:ok, content} = File.read("lib/day1.txt");
    lines = String.split(content, "\n")

    list = Enum.map(lines, &split_line(&1)) |> Enum.map(fn [left, right] -> {left, right} end)

    {left, right} = Enum.unzip(list)

    left_list = Enum.sort(left);
    right_list = Enum.sort(right);

    zipped = Enum.zip(left_list, right_list)

    Enum.map(zipped, fn {left, right}-> Day1.get_distante(left, right) end) |> Enum.sum()
  end

  def split_line(line) do
    String.split(line, ~r/\s+/)
  end

  def get_distante(left, right) do
    abs(left - right)
  end


end
