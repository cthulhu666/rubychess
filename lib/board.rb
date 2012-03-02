require 'position'

class Board
  
  def initialize(positions)
    @fields = Array.new
    [:white, :black].each { |color| add_pieces(color, positions[color]) }
  end
  
  def add_pieces(color, positions)
    positions.each do | k, v | 
      if v.is_a?Array
        v.each { |p| add_piece(color, k, p) }
      else
        add_piece(color, k, v)
      end
    end
  end
  
  def add_piece(color, piece, pos)
    p = Position.create pos
    puts "add_piece #{color} #{piece} #{p.ordinal}"
    @fields[p.ordinal] = [color, piece]
  end
  
  def is_clear?(pos)
    @fields[Position.create(pos).ordinal].nil?
  end
  
  def [](pos)
    return @fields[pos.ordinal] if pos.class==Position
    return @fields[pos] if pos.class==Fixnum
    return @fields[Position.create(pos).ordinal] if pos.class==String
  end
end
