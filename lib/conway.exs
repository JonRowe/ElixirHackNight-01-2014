defmodule Conway do

  def run [true] do
    [false]
  end

  def run board do
    board
    |> Enum.with_index
    |> Enum.map(fn {value, y} -> Enum.map Enum.with_index(value), fn {value, x} -> decide_fate(board x, y) end; end)
  end

  defp decide_fate board, x, y do
    previous_row = get(board, y - 1) || []
     current_row = get(board, y    ) || []
        next_row = get(board, y + 1) || []

    cell =  get(current_row, y)

    neighbours =
      count_neighbours(previous_row, x) +
      count_neighbours( current_row, x) +
      count_neighbours(    next_row, x)

    if cell do
      # off by one because cell is alive
      neighbours == 3 || neighbours == 4
    else
      neighbours == 3
    end
  end

  defp count_neighbours row, index do
    Enum.count slice(row, index), fn (value) -> value == true end
  end

  defp slice row, index do
    Enum.slice(row, index-1, 3) || []
  end

  defp get enum, index do
    if index < 0 do
      nil
    else
      if index >= Enum.count(enum) do
        nil
      else
        Enum.at enum, index
      end
    end
  end

end
