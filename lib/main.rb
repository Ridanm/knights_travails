require './board.rb'
require './box.rb'
require './boxes.rb'
require './knights.rb'
require './search_moves.rb'

board = Board.new 
knight = Knight.new
path_for = SearchMoves.new

moves = path_for.knight_moves([1, 4], [4, 7]) 
puts "\n# => knight_moves([row, column], [row, column]) row: from 1 to 8 column: 0 to 7('a' to 'h')".green
board.you_made_it(moves)
puts "Update Board from ['e', 1] :#{knight.white}=> ['f', 3] :#{board.red_dot}=> ['h', 4] :#{board.blue_dot}\n\n"
board.show_moves_path(moves, knight)


board.create_board # reset board board two
moves_two = path_for.knight_moves([3, 3], [4, 3])
board.you_made_it(moves_two)
puts "Update Board form knight_moves(['d', 3] :#{knight.white}=> ['e', 5]: #{board.red_dot}=> ['f', 3] :#{board.red_dot}=> ['d', 4] :#{board.blue_dot}\n\n"
board.show_moves_path(moves_two, knight)


board.create_board # reset board board three
another_path = path_for.knight_moves([1, 0], [7, 7])
board.show_moves_path(another_path, knight)

