require "helper"

class BoardTest < Test::Unit::TestCase

  setup do
    @board = Board.new(
        :white => {:king => :a1, :rook => :c1},
        :black => {:king => :h8, :rook => [:a7, :b7] }
    )
  end

  def test_initialize
    b = Board.new(:white => {:king => "A1", :knight => ["A2", "B2"]},
                  :black => {:king => "H8"})
  end

  def test_is_clear
    b = Board.new(:white => {:king => "A1"},
                  :black => {:king => "H8"})
    assert b.is_clear? Position.create "A2"
    assert !(b.is_clear? Position.create "A1")
  end

  test "query for a position using []" do
    assert_equal PieceOnBoard.new(:white, :king, :a1), @board["A1"]
    assert_equal PieceOnBoard.new(:black, :king, :h8), @board["H8"]
  end

  test "query for all white pieces" do
    p @board.pieces(:white)

  end

  test "query for all white pieces and do sth with them" do
    @board.pieces(:white) { |piece| p piece }
  end

end