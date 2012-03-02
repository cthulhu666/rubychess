require 'singleton'

class Queen
  include Piece, Ranged, Singleton
  
  attr_reader :moves
  
  def initialize
    @moves = generate_all_moves
  end
  
  def dirs
    [:n, :ne, :e, :se, :s, :sw, :w, :nw]
  end
end