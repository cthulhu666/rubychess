require 'position'

class Board
  
  def initialize positions
    @fields = Array.new
    add_pieces :white, positions[:white]
    add_pieces :black, positions[:black]
  end
  
  def add_pieces color, positions
    positions.each do | k, v | 
      if v.class==Array
        v.each { |p| add_piece(color, k, p) }
      elsif v.class==String
        add_piece(color, k, v)
      else
        raise "chuj"
      end
    end
  end
  
  def add_piece color, piece, pos
    p = Position.create pos
    puts "add_piece #{color} #{piece} #{p.ordinal}"
    @fields[p.ordinal] = [color, piece]
  end
  
  def is_clear? pos
    @fields[Position.create(pos).ordinal].nil?
  end
  
  def [] pos
    return @fields[pos.ordinal] if pos.class==Position
    return @fields[pos] if pos.class==Fixnum
    return @fields[Position.create(pos).ordinal] if pos.class==String
  end
end
