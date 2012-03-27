class Move
  def initialize(board, source_and_destination)
    @board = board
    @source_and_destination = source_and_destination.inject({}) { |h,(k,v)| h[ Position[k] ] = Position[v]; h }
  end
  
  def perform
    new_board = Board.new
    @board.pieces do |p|
      if dst = @source_and_destination[p.position]
        new_board.add_piece(p.color, p.piece, dst)
      else
        new_board.add_piece(p.color, p.piece, p.position)
      end
    end
    new_board
  end
end
