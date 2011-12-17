require "singleton"

class WhitePawn
  include Piece, Singleton
  
  # generuje wszystkie pozycje na które możliwy jest ruch z danej pozycji
  def generate_moves position
    moves = Array.new
    moves << position.go(:n)
    moves << position.go(:n, :n) if position.y==1    
  end
end