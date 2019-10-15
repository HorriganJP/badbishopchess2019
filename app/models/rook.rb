class Rook < Piece
  def valid_move?(new_x_coord, new_y_coord)
    x_distance = x_distance(new_x_coord)
    y_distance = y_distance(new_y_coord)

    return false if is_obstructed?([new_x_coord, new_y_coord])
    (x_distance >= 1 && y_distance == 0) || (x_distance == 0 && y_distance >= 1 ) 
  end
end