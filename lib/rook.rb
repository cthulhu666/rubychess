require "singleton"

class Rook
  include Piece, Singleton
  
  def generate_moves position
    rays = [:n, :e, :s, :w].map do |dir|
      Ray.create(position, dir)
    end
    rays.delete_if { |r| r.empty? }
  end
end