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
    space = proc { |elem| elem }
    BOARD.each do |row, col| 
      puts "#{row unless row == :let}  #{col.map(&space).join('') unless row == :let} "
    end 
    letters = -> (foot) { ' ' + foot }

    puts "   #{BOARD[:let].map(&letters).join(' ')}"
  end  

  def letter
    [*'a'..'h']
  end

  def update_square(column, row)
    abc_h = letter.index(column) if letter.include?(column)
    Boxes::BOARD[row][abc_h] 
  end

  def you_made_it(moves)
    puts "\n=> You made it in #{moves.size-1} moves!  Here's your path: #{moves}"
  end

  def show_moves_path(path, piece)
    return if path.nil?
    start_row, start_column = path.shift 
    target_row, target_column = path.pop 
    moves = "knight_moves([#{letter[start_column]}, #{start_row}],[#{letter[target_column]}, #{target_row}])"
    puts "\n  #{moves.yellow}\n\n"
    
    # first(column) second(row)
    if path.size == 0 
      update_square(letter[start_column], start_row).change_piece = piece.black 
      update_square(letter[target_column], target_row).change_piece = blue_dot 
      show()
    elsif path.size == 1  
      middle_row, middle_column = path[0] 
      update_square(letter[start_column], start_row).change_piece = piece.black 
      update_square(letter[middle_column], middle_row).change_piece = red_dot 
      update_square(letter[target_column], target_row).change_piece = blue_dot 
      show()
    else 
      update_square(letter[start_column], start_row).change_piece = piece.black 
      path.each do |row, column| 
        update_square(letter[column], row).change_piece = red_dot 
      end 
      update_square(letter[target_column], target_row).change_piece = blue_dot
      show()
    end
  end
end
