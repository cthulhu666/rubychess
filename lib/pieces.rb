module Pieces
  
  PIECES = {
    :king => King.instance,
    :queen => Queen.instance,
    :rook => Rook.instance,
    :bishop => Bishop.instance,
    :knight => Knight.instance

  }

  def self.[](name_or_object)
    return name_or_object if name_or_object.is_a?(Piece)
    piece = PIECES[name_or_object.to_sym]
    raise "Unknown piece: #{name_or_object}" if piece.nil?
    piece
  end
end