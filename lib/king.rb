require 'singleton'

class King 
  include Piece, Singleton
  
  def generate_moves(position)
    position.all_neighbours
  end

  def valid_moves(pos, board)
    []
  end
end