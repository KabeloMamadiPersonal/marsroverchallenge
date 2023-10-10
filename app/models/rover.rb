class Rover < ActiveRecord::Base

  def make_movements
    moves = movements.chars
    moves.each do |move|
      if move == 'L'
        rotate_left
      elsif move == 'R'
        rotate_right
      elsif move == 'M'
        move_rover
      end
    end
  end

  private

  def rotate_left
    new_direction =
      if direction == 'N'
        'W'
      elsif direction == 'E'
        'N'
      elsif direction == 'S'
        'E'
      elsif direction == 'W'
        'S'
      end
    update!(direction: new_direction)
  end

  def rotate_right
    new_direction =
      if direction == 'N'
        'E'
      elsif direction == 'E'
        'S'
      elsif direction == 'S'
        'W'
      elsif direction == 'W'
        'N'
      end
    update!(direction: new_direction)
  end

  def move_rover
    new_x_coordinate = x_coordinate
    new_y_coordinate = y_coordinate
    plateau = Plateau.all.first
    if direction == 'N' && ((y_coordinate + 1) <= plateau.height)
      new_y_coordinate = y_coordinate + 1
    elsif direction == 'E' && ((x_coordinate + 1) <= plateau.width)
      new_x_coordinate = x_coordinate + 1
    elsif direction == 'S' && ((y_coordinate - 1) > -1)
      new_y_coordinate = y_coordinate - 1
    elsif direction == 'W' && ((x_coordinate - 1) > -1)
      new_x_coordinate = x_coordinate - 1
    end
    update!(x_coordinate: new_x_coordinate, y_coordinate: new_y_coordinate)
  end
end