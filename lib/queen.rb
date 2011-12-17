require 'ray'
require 'piece'
require 'singleton'

class Queen
  include Piece, Singleton
  
  attr_reader :moves
  
  def initialize
    @moves = generate_all_moves
  end
  
  def generate_moves position
    @rays = Array.new
    for dir in [:n, :ne, :e, :se, :s, :sw, :w, :nw]
      @rays << Ray.create(position, dir)
    end
    @rays.delete_if { |r| r.length == 0 }
  end
  
  def valid_moves pos, board
    pos = Position.create(pos)
    valid_moves = []
    my_color, my_piece = board[pos]
    puts "my_color: #{my_color}; my_piece: #{my_piece}"
    moves.fetch(pos.ordinal).each do |ray|
      puts "ray: #{ray}"
      ray.each do |dst|
        color, piece = board[dst]
        puts "dst: #{dst}; color: #{color}; piece: #{piece}"
        valid_moves << dst if (my_color != color) 
        break unless color.nil?
       end
    end
    valid_moves
  end
end