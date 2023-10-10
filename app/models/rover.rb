class Rover < ActiveRecord::Base

  validates :movements, :direction , presence: true
  validates :x_coordinate, :y_coordinate, presence: true, numericality: true
  validates :direction, inclusion: { in: %w[N E S W], message: 'Only N, E, S, W'}

  RIGHT = {
    'N' => 'E',
    'E' => 'S',
    'S' => 'W',
    'W' => 'N'
  }.freeze

  LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze

  def make_movements
    moves = movements.chars
    moves.each do |move|
      case move
      when 'L'
        rotate_left
      when 'R'
        rotate_right
      when 'M'
        move_rover
      end
    end
  end

  private

  def rotate_left
    update!(direction: LEFT[direction])
  end

  def rotate_right
    update!(direction: RIGHT[direction])
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