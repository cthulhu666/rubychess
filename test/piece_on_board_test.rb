require "helper"

class PieceOnBoardTest < Test::Unit::TestCase

  test "two instances with same piece,color and position should be equal" do
    p1 = PieceOnBoard.new(:white, :queen, :g3)
    p2 = PieceOnBoard.new(:white, :queen, :g3)
    assert p1 == p2
  end
end