require './board.rb'
require './box.rb'
require './boxes.rb'
require './knights.rb'
require './search_moves.rb'

board = Board.new 
knight = Knight.new
path_for = SearchMoves.new

k_black = knight.black
red_dot = board.red_dot
cyan_dot = board.cyan_dot 

board.update_square('a', 1).change_piece = cyan_dot
d4 = board.update_square('d', 4)
e2 = board.update_square('e', 2)
h8 = board.update_square('h', 8)

# a1.change_piece = cyan_dot 
d4.change_piece = k_black
e2.change_piece = red_dot
h8.change_piece = red_dot

board.show

moves = path_for.knight_moves([1, 4], [4, 7])
puts "\n=> You made it in #{moves.size-1} moves!  Here's your path: #{moves}"

puts "\nUpdate Board..."




