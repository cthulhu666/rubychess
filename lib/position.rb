class Position 
  include Comparable
  
  attr_reader :ordinal, :x, :y
  
  DIRECTIONS = { n: [0, 1], ne: [1, 1], e: [1, 0], se: [1, -1], s: [0, -1], sw: [-1, -1], w: [-1, 0], nw: [-1, 1] }
  
  def initialize x, y
    raise "x must be between 0..7" unless (0..7).include? x
    raise "y must be between 0..7" unless (0..7).include? y
    @x, @y = x, y
    @ordinal = x + y * 8;
  end
  
  @@position = Array.new  
  (0..7).each do |x|
    (0..7).each do |y|
      p = Position.new x, y
      @@position[x + y * 8] = p 
    end
  end
  @@position.freeze
  
  ILLEGAL = Object.new
  
  def self.create pos
    case pos
    when Position
      return pos
    when Numeric
      return @@position[pos]
    else
      byte_x, byte_y = pos.to_s.upcase.bytes.map(&:to_i)
      x = byte_x - 65;
      y = byte_y - 49;
      raise "x must be between 0..7" unless (0..7).include? x
      raise "y must be between 0..7" unless (0..7).include? y
      return @@position[x + y * 8]
    end    
  end

  def self.[](pos)
    create(pos)
  end
  
  def self.all
    @@position.dup
  end
  
  def <=>(other)
    ordinal <=> other.ordinal
  end
  
  def neighbour dir
    x, y = DIRECTIONS[dir]
    raise "dir should be one of #{DIRECTIONS.keys}" unless x
    x += self.x
    y += self.y    
    if (0..7).include?(x) && (0..7).include?(y)
      Position.new(x, y)
    else
      ILLEGAL
    end
  end
  
  def go *dirs
    dst = self
    dirs.each do |d| 
      dst = dst.neighbour(d)
      return dst if dst==ILLEGAL
    end
    return dst
  end
  
  def all_neighbours 
    neighbours = DIRECTIONS.map { |k,v| neighbour(k) }
    neighbours.delete_if { |n| n==ILLEGAL }
  end
  
  def to_s
   ('A'..'H').to_a[@x] + (@y+1).to_s
  end
  
  def method_missing(name, *args)
    if (name =~ /^go_.*$/) == 0
      dir = name[3..-1].to_sym
      neighbour(dir)
    else
      super(name, *args)
    end
  end
  
  
end
