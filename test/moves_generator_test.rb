require "helper"

class MovesGeneratorTest < Test::Unit::TestCase

  test "" do
    board = Board.new(
        {
            :white => {:king => :g1, :queen => :e2},
            :black => {:king => :e8, :queen => :d8}
        })
    moves = MovesGenerator.generate_moves(board, :white)
  end
end