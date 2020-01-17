require './board/algorithms/bfs.rb'
require './board/algorithms/og_dfs.rb'
require './board/board.rb'

class Game
    def initialize

    end
end

# The way to run the game is to run 'ruby game.rb'
# The end goal is to have a path finder visualizer website
# Along with a sudoku algorithm visualizer
# And a chess AI visualizer

# Convert all the code to javascript come 2 before March. 
#adfkj
if __FILE__ == $PROGRAM_NAME
    board = Board.new(35, 35)
    # p board.render
    end_point = board.rand_pos
    algo = BFS.new(board, end_point)
    # algo = DFS.new(board, end_point)
    algo.create_path
end