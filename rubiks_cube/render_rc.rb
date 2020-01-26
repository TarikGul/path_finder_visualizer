module RenderRC
    def render_u_or_b_grid(grid)
        grid.each_with_index do |row, idx|
            row = convert_to_color(row, idx)
            puts "       " + row.join("")
        end
        puts ""
    end

    def render_middle_grids(l_grid_rows, f_grid_rows, r_grid_rows, b_grid_rows)
        (0...l_grid_rows.length).each do |idx|
            l_grid_row = convert_to_color(l_grid_rows[idx])
            f_grid_row = convert_to_color(f_grid_rows[idx])
            r_grid_row = convert_to_color(r_grid_rows[idx])
            b_grid_row = convert_to_color(b_grid_rows[idx])
            puts l_grid_row.join("") + " " + f_grid_row.join("") + " " + r_grid_row.join("") + " " + b_grid_row.join("")
        end
        puts ""
    end

    def convert_to_color(row, idx2="")
        row.map.with_index {|tile, idx| " #{idx2}#{idx} ".to_s.colorize(:background => tile.color)}
    end
end