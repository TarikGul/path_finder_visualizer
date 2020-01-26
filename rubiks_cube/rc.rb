require 'colorize'
require_relative 'grid'
require_relative 'render_rc'
require_relative 'algo'

class RC 
    include RenderRC
    include RotateAlgorithm

    attr_accessor :f_grid, :l_grid, :r_grid, :u_grid, :d_grid, :b_grid, :cube
    COLORS = [:red, :green, :yellow, :blue, :white, :magenta]

    def initialize        
        @f_grid = Grid.new(:red, :F)
        @l_grid = Grid.new(:green, :L)
        @r_grid = Grid.new(:yellow, :R)
        @u_grid = Grid.new(:blue, :B)
        @d_grid = Grid.new(:white, :D)
        @b_grid = Grid.new(:magenta, :B)
        @cube = { F: @f_grid, 
                L: @l_grid, 
                R: @r_grid,
                U: @u_grid, 
                D: @d_grid, 
                B: @b_grid }
    end

    def render
        render_u_or_b_grid(@u_grid.rows)
        render_middle_grids(@l_grid.rows, @f_grid.rows, @r_grid.rows, @d_grid.rows)
        render_u_or_b_grid(@b_grid.rows)
    end

    def deep_dup_cube(cube)
        new_cube = {}
        cube.each { |k, v| new_cube[k] = deep_dup(v.rows) }
        new_cube
    end

    def deep_dup(input_arr)
        arr = []
        input_arr.each do |el|
            if el.is_a?(Array)
                arr << deep_dup(el)
            else
                arr << el.clone
            end
        end
        arr
    end
end

b1 = RC.new
b1.render
b1.clockwise(b1.u_grid)
b1.render