require 'position'

class Board

  ENTRY = Struct.new(:piece, :color, :position)

  def initialize(positions)
    @fields = Array.new
    [:white, :black].each { |color| add_pieces(color, positions[color]) }
  end

  def add_pieces(color, positions)
    positions.each do |k, v|
      if v.is_a? Array
        v.each { |p| add_piece(color, k, p) }
      else
        add_piece(color, k, v)
      end
    end
  end

  def add_piece(color, piece, position)
    p = Position[position]
    @fields[p.ordinal] = PieceOnBoard.new(color, piece, p)
  end

  def is_clear?(pos)
    @fields[Position[pos].ordinal].nil?
  end

  def [](pos)
    return @fields[pos.ordinal] if pos.is_a? Position
    return @fields[pos] if pos.is_a? Fixnum
    return @fields[Position[pos].ordinal] if pos.is_a? String
  end

  def pieces(color)
    pieces = @fields.inject([]) do |pieces, f|
      pieces << f if f && f.color == color
      pieces
    end
    pieces.compact!
    pieces.each { |p| yield p } if block_given?
    pieces
  end
end
