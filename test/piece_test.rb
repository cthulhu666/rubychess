require "helper"

class PieceTest < Test::Unit::TestCase
  
  def test_generate_all_moves_king
    k = King.instance
    k.generate_all_moves
  end
  
  def test_generate_all_moves_queen
    q = Queen.instance
    q.generate_all_moves
  end
  
  def test_valid_moves_queen
    q = Queen.instance
    q.generate_all_moves
    board = Board.new(:white => {:queen => "A1"}, :black => {:queen => "A3"})
    q.valid_moves "A1", board
  end
end
