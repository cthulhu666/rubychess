require "test/unit"
require "board"

class BoardTest < Test::Unit::TestCase
  
  def test_initialize
    b = Board.new(:white => { :king => "A1", :pawn => ["A2", "B2", "C2"] }, 
                  :black => { :king => "H8"})
  end
  
  def test_is_clear
    b = Board.new(:white => { :king => "A1"}, 
                  :black => { :king => "H8"})
    assert b.is_clear Position.create "A2"
    assert !(b.is_clear Position.create "A1")
  end
  
  def test_aaa
    board = Board.new(:white => { :king => "A1"}, 
                  :black => { :king => "H8"})
    
    assert_equal [:white, :king], board[Position.create("A1")]
    assert_equal [:black, :king], board[Position.create("H8")]
    
    assert_equal [:white, :king], board["A1"]
    assert_equal [:black, :king], board["H8"]
    
    assert_equal [:white, :king], board[0]
    assert_equal [:black, :king], board[63]
  end
    
end