require "singleton"

class Rook
  include Piece, Ranged, Singleton
  
  def dirs
    [:n, :e, :s, :w]
  end
end