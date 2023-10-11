require './board.rb'
require './box.rb'
require './boxes.rb'
require './knights.rb'
require './search_moves.rb'

board = Board.new 
knight = Knight.new
path_for = SearchMoves.new

moves = path_for.knight_moves([1, 4], [4, 7]) 
column_row = "# => knight_moves([row, column], [row, column]) row: from 1 to 8 column: 0 to 7('a' to 'h')"
puts "\nknight_moves([1, 4], [4, 7]):".yellow 
puts column_row.green 
board.you_made_it(moves)

puts "Update Board from ['e', 1] :#{knight.white}=> ['f', 3] :#{board.red_dot}=> ['h', 4] :#{board.blue_dot}\n\n"
board.update_square('e', 1).change_piece = knight.black 
board.update_square('f',3).change_piece = board.red_dot
board.update_square('h', 4).change_piece = board.blue_dot
board.show


board.create_board # reset board 
moves_two = path_for.knight_moves([3, 3], [4, 3])
puts "\nknight_moves([3, 3],[4, 3])".yellow
board.you_made_it(moves_two)

puts "Update Board form knight_moves(['d', 3] :#{knight.white}=> ['e', 5]: #{board.red_dot}=> ['f', 3] :#{board.red_dot}=> ['d', 4] :#{board.blue_dot}\n\n"
board.update_square('d', 3).change_piece = knight.black 
board.update_square('e', 5).change_piece = board.red_dot 
board.update_square('f', 3).change_piece = board.red_dot 
board.update_square('d', 4).change_piece = board.blue_dot 
board.show 

board.create_board # reset board 
another_path = path_for.knight_moves([1, 0], [7, 7])
board.show_moves_path([[1, 0], [3, 1], [5, 2], [7, 3], [8, 5], [7, 7]], knight)