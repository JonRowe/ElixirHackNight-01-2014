Code.load_file("lib/conway.exs")

defmodule ConwayTest do
  use ExUnit.Case

  test "A lone live cell will die" do
    new_board = Conway.run [true]
    assert new_board == [false]
  end

  test "A cell with fewer than two neighbours will die" do
    new_board = Conway.run [
                             [false, false, false],
                             [false,  true,  true],
                             [false, false, false]
                           ]
    assert new_board ==    [
                             [false, false, false],
                             [false, false, false],
                             [false, false, false]
                            ]
  end

  test "A cell with two neighbours lives!" do
    new_board = Conway.run [
                             [false, false, false],
                             [false,  true, false],
                             [false,  true,  true],
                             [false, false, false]
                           ]
    assert new_board ==    [
                             [false, false, false],
                             [false,  true,  true],
                             [false,  true,  true],
                             [false, false, false]
                            ]
  end
end
