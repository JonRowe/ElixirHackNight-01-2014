defmodule Conway do

  def run [true] do
    [false]
  end

  def run board do
    board
    |> count_neighbours
    |> still_alive
  end

  defp count_neighbours board do
    board
  end

  defp still_alive board do
    Enum.map board, fn (row) -> Enum.map row, fn (cell) -> cell == 2 end; end
  end

end
