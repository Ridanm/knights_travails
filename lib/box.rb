class Box 
  attr_accessor :change_piece, :back_color 

  def initialize(change_piece='   ', back_color)
    @change_piece = change_piece
    @back_color = back_color 
  end 

  def to_s 
    "#{change_piece.colorize(:background => back_color.to_sym)}"
  end
end 

