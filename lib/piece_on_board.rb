class PieceOnBoard
  include Comparable

  attr_reader :color, :piece, :position

  def initialize(color, piece_or_name, position)
    @piece = Pieces[piece_or_name]
    @color = color
    @position = Position[position]
  end

  def <=>(other_piece)
    [color, piece, position] <=> [other_piece.color, other_piece.piece, other_piece.position]
  end

  def valid_moves(board)
    piece.valid_moves(position, board)
  end

end