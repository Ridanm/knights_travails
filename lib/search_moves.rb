class SearchMoves
  attr_accessor :graph

  def initialize
    @graph = {}
  end

  def has_vertex?(value)
    graph.has_key?(value)
  end

  def add_vertex(value)
    @graph[value] = []
  end

  def add_edge(vertex, edge)
    @graph[vertex] << edge if has_vertex?(vertex)
  end

  def get_childs(vertex)
    graph[vertex] if has_vertex?(vertex)
  end

  def check_quadrant(value)  
    row, column = *value
    row.between?(1, 8) && column.between?(0, 7)
  end

  def add_jumps(vertex)
    jumps = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [2, -1], [1, -2]]
    result = []
    row, column = *vertex 

    jumps.each do |jump|
      x, y = jump 
      result << [x + row, y + column]
    end
    result 
  end

  def knight_moves(start, target)
    return puts "Incorrect Coordinates...".light_red if !check_quadrant(start) || !check_quadrant(target)
    path = [start]
    queue = [path] 

    until queue.empty?
      current_path = queue.shift
      return current_path if current_path[-1] == target

      add_vertex(current_path[-1])
      add_jumps(current_path[-1]).each do |jump| 
        graph[current_path[-1]] << jump if check_quadrant(jump)
      end

      for next_vertex in get_childs(current_path[-1])
        new_path = current_path + [next_vertex] # [[a, b], [a, c], [a, d]]
         queue << new_path
       end
      end
  end
end 


