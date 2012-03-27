require "helper"

class MoveTest < Test::Unit::TestCase
  test "piece should move" do
    board = Board.new(
        {
            :white => {:king => :g1, :queen => :e2},
            :black => {:king => :e8, :queen => :d8}
        }).freeze
    m = Move.new(board, :e8 => :e7)
    new_board = m.perform
    assert_equal PieceOnBoard.new(:black, :king, :e7), new_board[:e7]
    assert_nil new_board[:e8]    
  end
end
