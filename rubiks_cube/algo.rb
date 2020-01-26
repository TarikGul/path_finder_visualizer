# We want to be able to set a primary face 
# take that primary face and decide do we want to turn it clockwise or 
# counter clockwise

# old_grid = f_grid
# new_grid = F_grid.deep_dup
# need to deep dup all grids, not just one
require_relative "rotate_directions"
require 'byebug'
module RotateAlgorithm 
  include RotateDirections
  
  def relative_order 
    #FIX ME FIX ME FIX ME
    #KEY = relative position so algo knows how to treat
    # relative positions are LF, U, RF, and B, 
    # value is the grid for that relative position considering
    # our 'virtual face'
    # cube 
    {
      :F => {L: :L, R: :R, U: :U, D: :D}, 
      :L => {F: :F, U: :U, D: :D, B: :B},
      :R => {F: :F, U: :U, D: :D, B: :B},
      :U => {F: :F, L: :L, R: :R, B: :B},
      :D => [F: :F, L: :L, R: :R, B: :B],
      # :B => {L: :L, R: :R, U: :U, D: :D}
    }
  end

  def clockwise_get_start_dest_grids(name, cube_copy, primary_face_symbol)
    case name
    when :lf_to_u
      start = relative_order[primary_face_symbol][:L]
      dest = relative_order[primary_face_symbol][:U]
    when :u_to_rf
      start = relative_order[primary_face_symbol][:U]
      dest = relative_order[primary_face_symbol][:R]
    when :rf_to_d 
      start = relative_order[primary_face_symbol][:R]
      dest = relative_order[primary_face_symbol][:D]
    when :d_to_lf
      start = relative_order[primary_face_symbol][:D]
      dest = relative_order[primary_face_symbol][:L]
    end
    # debugger
    # TODO make sure to implement find_grid_copy
    start = find_grid_copy(cube_copy, start)
    dest = find_grid(dest)
    
    [start, dest]
  end

# primary face should be f
  def clockwise(primary_face, n = 1)  
    cube_copy = deep_dup_cube(cube)
    # p cube_copy
    # p "cube copy"
    f_rotations.each do |name, pos_changes|
      start, dest = clockwise_get_start_dest_grids(name, cube_copy, primary_face.symbol)
      pos_changes.each do |start_pos, dest_pos|
        # debugger
        r, c = start_pos
        dest[dest_pos].color = start[r][c].color
      end
    end
  end

  # def counter_clockwise(primary_face)
  #   old_grid = primary_face
  #   new_grid = old_grid.deep_dup

  #   f_prime_rotations.each do |hash|
  #     hash.each do |k, v|
  #       old_grid[k].color = new_grid[v].color
  #     end
  #   end
  # end

  def find_grid(symbol)
    cube[symbol]
  end

  def find_grid_copy(cube_copy, symbol)
    cube_copy[symbol]
  end

  def get_rotate_face_vals(face)
    values = []

    #top row
    (0..2).each do |i|
      values << face[[0, i]].color.clone
    end

    #far right col
    [1, 2].each do |i|
      values << face[[i, 2]].color.clone
    end

    #bottom row
    [1, 0].each do |i|
      values << face[[2, i]].color.clone
    end

    #left col
    [1].each do |i|
      values << face[[i, 0]].color.clone
    end
  end

  def place_rotate_vals(face, rotated_vals)
    values = rotated_vals.clone  
    #top row
    [0, 1, 2].each do |i|
      face[[0, i]].color = values.shift
    end

    #far right col
    [1, 2].each do |i|
      face[[i, 2]].color = values.shift
    end

    #bottom row
    [1, 0].each do |i|
      face[[2, i]].color = values.shift
    end

    #left col
    [1].each do |i|
      face[[i, 0]].color = values.shift
    end
  end

  def right_face_rotate(face)
    p "before rotating right"
    p face
    values = get_rotate_face_vals(face)
    # right rotation => back of array moves to front
    rotated = values.rotate(-2)
    place_rotate_vals(face, rotated)

    p "after rotating right"
    p face
  end

  def left_face_rotate(face)  
    p "before rotating left"
    p face

    values = get_rotate_face_vals(face)
    # left rotation => front of array moves to back
    rotated = values.rotate(2)
    place_rotate_vals(face, rotated)

    p "after rotating left"
    p face
  end


  # This deep dups our cube so that we can replace our old board with our new board and repeat without having duplicates in our iterations
  

  # if $FILE_NAME == __FILE__
  #   #todo write test here with 
  # end

end

