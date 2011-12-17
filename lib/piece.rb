module Piece
      
  def generate_all_moves
    moves = []
    (0...8).each do |x|
      (0...8).each do |y|
        p = Position.new x,y
        moves[p.ordinal] = generate_moves p
        puts "#{p} -> #{moves[p.ordinal]}"
      end
    end
    moves
  end
  
#  def valid_moves pos, board
#    moves.each { |m| puts m }
#  end
end