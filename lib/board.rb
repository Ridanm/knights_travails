require './boxes.rb'

class Board 
  include Boxes 

  def initialize 
    create_board()
  end

  def create_board 
    for row in 1..8 do 
      for column in 0..7 do 
        if (row + column) % 2 == 0 
          BOARD[row][column] = Box.new('light_yellow')
        else 
          BOARD[row][column] = Box.new('yellow')
        end
      end
    end
    BOARD 
  end

  def show
    # generar la misma cantidad de espacios con los números que tienen longitud 1
    space = proc { |elem| elem }
    # mostrando el tablero con sus correspondientes espacios
    BOARD.each do |row, col| # key value this is a hash 
      puts "#{row unless row == :let}  #{col.map(&space).join('') unless row == :let} "
    end 
    # representando las letras del tablero 
    letters = -> (foot) { ' ' + foot }
    puts "   #{BOARD[:let].map(&letters).join(' ')}"
  end  

  def update_square(column, row)
    letters = [*'a'..'h']
    abc_h = letters.index(column) if letters.include?(column)
    Boxes::BOARD[row][abc_h] 
  end
end
