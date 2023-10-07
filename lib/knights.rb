require 'colorize'

class Knight  
  include Boxes 

  def white 
    " \u2658 "
  end 

  def black 
    " \u265E ".black
  end

  # https://www.techiedelight.com/chess-knight-problem-find-shortest-path-source-destination/ 

  def is_valid?(row, column) 
    (row.between?(1, 8)) && (column.between?(0, 7))
  end
end 






# puts "Busqueda en anplitud BFS"
# puts "Dado un grafo usamos una cola una variable \npara los nodos visitado column una lista de adyacencia..."

# require 'set'
# class Solution # posible solution 
#   def knight(n, m, x1, y1, x2, y2)
#     dx = [-1, -2, -1, -2, 1, 2, 1, 2]
#     dy = [-2, -1, 2, 1, -2, -1, 2, 1]

#     visited = Array.new(n + 1) { Array.new(m + 1, false) }
#     queue = []

#     queue << [x1, y1]
#     visited[x1][y1] = true
#     move_count = 0

#     until queue.empty?
#       nodes_at_current_breadth = queue.length

#       nodes_at_current_breadth.times do
#         curr_pos = queue.shift
#         return move_count if curr_pos == [x2, y2]

#         8.times do |i|
#           new_x = curr_pos[0] + dx[i]
#           new_y = curr_pos[1] + dy[i]

#           if is_valid?(new_x, new_y, n, m) && !visited[new_x][new_y]
#             queue << [new_x, new_y]
#             visited[new_x][new_y] = true
#           end
#         end
#       end

#       move_count += 1
#     end

#     -1
#   end

#   private

#   def is_valid?(row, column, n, m)
#     row > 0 && column > 0 && row <= n && column <= m
#   end
# end

# # Ejemplo de uso
# solver = Solution.new
# puts solver.knight(8, 8, 1, 1, 8, 8) # Output: 6





# https://www.youtube.com/watch?v=9-rOWC6-S08
=begin   
public class Solution {
    public int knight(int N, int M, int x1, int y1, int x2, int y2) {
       
        int[] dx = {-1, -2, -1, -2, 1, 2, 1, 2};
        int[] dy = {-2, -1, 2, 1, -2, -1, 2, 1};
        boolean[][] isVisited = new boolean[N+1][M+1];
        Queue<Coordinate> queue = new LinkedList<Coordinate>();
        queue.add(new Coordinate(x1, y1));
        isVisited[x1][y1] = true;
        int moveCount = 0;
        
        while (!queue.isEmpty()) {
            int nodesAtCurrentBreadth = queue.size();
            for (int count = 0; count < nodesAtCurrentBreadth; count++) {
                Coordinate currPos = queue.remove();
                if (currPos.row == x2 && currPos.column == y2) {
                    return moveCount;
                }

                for (int i = 0; i < 8; i++) {
                    if (isValid(currPos.row + dx[i], currPos.column + dy[i], N, M) && isVisited[currPos.row + dx[i]][currPos.column + dy[i]] == false) {
                        queue.add(new Coordinate(currPos.row + dx[i], currPos.column + dy[i]));
                        isVisited[currPos.row + dx[i]][currPos.column + dy[i]] = true;
                    }
                }                
            }
            moveCount++;
        }
        
        return -1;
    }
    
    private boolean isValid(int row, int column, int N, int M) {
        if (row <= 0 || column <= 0 || row > N || column > M) {
            return false;
        }
        
        return true;
    }
    
}

class Coordinate {
    int row, column;
    
    public Coordinate(int row, int column) {
        this.row = row;
        this.column = column;
    }
}

=end
