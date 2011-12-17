require "test/unit"
require "ray.rb"
require "position.rb"
class RayTest < Test::Unit::TestCase
  
  def test_create_a1_n
    ray = Ray.create(Position.create('A1'), :n)
    puts ray
    assert_equal 7, ray.length
    assert ray.include? 'A2'
    assert ray.include? Position.create 'A2'
    assert ray.include? 'A3'
    assert !ray.include?('B2')
  end
end