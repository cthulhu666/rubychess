class Ray
  
  def Ray.create start, dir
    positions = Array.new
    position = start
    while (position = position.neighbour(dir)) != Position::ILLEGAL
      positions << position
    end
    Ray.new positions
  end
  
  def initialize positions
    @positions = positions
  end
  
  def to_s
    @positions.to_s
  end
  
  def length
    @positions.length
  end
  
  def include? pos
    if pos.class == Position
      @positions.include? pos
    elsif pos.class == String
      @positions.find { |p| p.to_s == pos }
    end
  end
  
  def each &block
    @positions.each{|p| block.call(p)}
  end

end