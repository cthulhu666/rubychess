module Piece
  def generate_all_moves
    moves = []
    (0..7).each do |x|
      (0..7).each do |y|
        p = Position.new x,y
        moves[p.ordinal] = generate_moves p
        # puts "#{p} -> #{moves[p.ordinal]}"
      end
    end
    moves
  end
end