require "test/unit"
require "queen"
require "position"
require "board"

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
    puts q.valid_moves(Position.create("A1"), board)
  end
end