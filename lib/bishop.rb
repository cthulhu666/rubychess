require "singleton"

class Bishop
  include Piece, Ranged, Singleton
  
  def dirs
    [:ne, :se, :sw, :nw]
  end
end