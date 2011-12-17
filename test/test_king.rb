require "test/unit"
require "king.rb"
require "position.rb"
class KingTest < Test::Unit::TestCase
  
  def test_generate_moves_a1
    k = King.instance
    moves = k.generate_moves Position.create 'A1'
    assert_equal 3, moves.size
    assert moves.find { |pos| pos.to_s == 'A2'}
    assert moves.find { |pos| pos.to_s == 'B2'}
    assert moves.find { |pos| pos.to_s == 'B1'}
  end
  
  def test_generate_moves_c4
    k = King.instance
    moves = k.generate_moves Position.create 'C4'
    assert_equal 8, moves.size
    assert moves.find { |pos| pos.to_s == 'C5'}
    assert moves.find { |pos| pos.to_s == 'D5'}
    assert moves.find { |pos| pos.to_s == 'D4'}
    assert moves.find { |pos| pos.to_s == 'D3'}
    assert moves.find { |pos| pos.to_s == 'C3'}
    assert moves.find { |pos| pos.to_s == 'B3'}
    assert moves.find { |pos| pos.to_s == 'B4'}
    assert moves.find { |pos| pos.to_s == 'B5'}
  end
end