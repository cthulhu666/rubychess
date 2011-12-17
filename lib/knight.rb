#encoding: utf-8
require "singleton"

class Knight
  include Piece, Singleton
  
  # generuje wszystkie pozycje na które możliwy jest ruch z danej pozycji
  def generate_moves position
    moves = Array.new
    moves << position.go(:n, :n, :e)
    moves << position.go(:e, :e, :n)
    moves << position.go(:e, :e, :s)
    moves << position.go(:s, :s, :e)
    moves << position.go(:s, :s, :w)
    moves << position.go(:w, :w, :s)
    moves << position.go(:w, :w, :n)
    moves << position.go(:n, :n, :w)
  end
end