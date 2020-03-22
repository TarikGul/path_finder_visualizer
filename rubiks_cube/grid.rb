require_relative 'tile'
require 'byebug'
class Grid
    attr_reader :rows, :symbol

    def self.set_grid(color, n=3)
        arr = Array.new(n){Array.new(n, Tile.new(color))}
    end

    def initialize(color, symbol)
        @rows = Grid.set_grid(color)
        @symbol = symbol
    end

    def [](pos)
      x, y = pos
      @rows[x][y]
    end


end