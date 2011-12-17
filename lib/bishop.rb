class Bishop
  def generate_moves position
    @rays = Array.new
    for dir in [:ne, :se, :sw, :nw]
      @rays << Ray.create(position, dir)
    end
    @rays.delete_if { |r| r.length == 0 }
  end
end