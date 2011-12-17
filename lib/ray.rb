class Ray
  
  def self.create start, dir
    positions = Array.new
    
    position = case start
    when Position
      start
    else
      Position.create(start)      
    end
    
    while (position = position.neighbour(dir)) != Position::ILLEGAL
      positions << position
    end
    Ray.new positions
  end
  
  def initialize positions
    @positions = positions
  end
  
  def to_s
    @positions.inject("") { |str, pos| str << pos.to_s }
  end
  
  def length
    @positions.length
  end
  
  def empty?
    length == 0
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