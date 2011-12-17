require "helper"

class BishopTest < Test::Unit::TestCase
  def test_generate_moves
    rays = Bishop.new.generate_moves Position.create 'B2'
    assert_equal 4, rays.length
    assert_equal "C3D4E5F6G7H8", rays[0].to_s
    assert_equal "C1", rays[1].to_s
    assert_equal "A1", rays[2].to_s
    assert_equal "A3", rays[3].to_s
  end
end