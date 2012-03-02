require "helper"

class PositionTest < Test::Unit::TestCase

  test "create with []" do
    assert_equal "A1", Position["A1"].to_s
  end
  
  def test_create_string 
    assert_equal "A1", Position.create("A1").to_s
  end
  
  def test_create_string_downcased
    assert_equal "A1", Position.create("a1").to_s
  end
  
  def test_create_symbol
    assert_equal "A1", Position.create(:a1).to_s
  end

  def test_n
    pos = Position.create 'A1'
    assert_equal Position.create('A2'), pos.go_n
  end
  
  def test_ne
    pos = Position.create 'A1'
    assert_equal Position.create('B2'), pos.go_ne
    pos = Position.create 'A8'
    assert_equal Position::ILLEGAL, pos.go_ne
  end
  
  def test_all_neighbours
    pos = Position.create 'A1'
    assert_equal 3, pos.all_neighbours.size
  end
  
  def test_neighbour_ne
    pos = Position.create 'A1'
    assert pos.neighbour(:ne).to_s == 'B2'
  end
  
  def test_compare
    assert Position.create('A1') == Position.create('A1')
  end
  
  def test_ordinal
    assert_equal 0, Position.create('A1').ordinal
    assert_equal 1, Position.create('B1').ordinal
    assert_equal 63, Position.create('H8').ordinal
  end
  
  def test_go
    assert_equal Position.create('B3'), Position.create('A1').go(:n, :n, :e)
    assert_equal Position::ILLEGAL, Position.create('A7').go(:n, :n, :e)
    assert_equal Position::ILLEGAL, Position.create('A8').go(:n, :n, :e)
  end
end