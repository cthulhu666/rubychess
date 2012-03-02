require "helper"

class QueenTest < Test::Unit::TestCase
  
  def test_generate_moves_a1
    queen = Queen.instance
    rays = queen.generate_moves(Position.create 'A1')
    assert_equal 3, rays.length
    assert_equal "A2A3A4A5A6A7A8", rays[0].to_s
    assert_equal "B2C3D4E5F6G7H8", rays[1].to_s
    assert_equal "B1C1D1E1F1G1H1", rays[2].to_s
  end
  
   def test_valid_moves_queen
    q = Queen.instance
    board = Board.new(:white => {:queen => "A1"}, :black => {:queen => "A3"})
    assert_equal ["A2", "A3", "B2", "C3", "D4", "E5", "F6", "G7", "H8",  "B1", "C1", "D1", "E1", "F1", "G1", "H1"], q.valid_moves(Position["A1"], board).map(&:to_s)
  end
end