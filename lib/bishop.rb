require "singleton"

class Bishop
  include Piece, Singleton
  
  def generate_moves position
    rays = [:ne, :se, :sw, :nw].map do |dir|
      Ray.create(position, dir)
    end
    rays.delete_if { |r| r.empty? }
  end
end