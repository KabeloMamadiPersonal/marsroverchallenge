require 'rails_helper'

RSpec.describe Rover, type: :model do
  describe 'create rover' do
    it 'will store rover details' do
      first_rover = Rover.create!(x_coordinate: 1, y_coordinate: 2, direction: 'N', movements: 'LMLMLMLMM' )

      expect(Rover.all.count).to eq 1
      expect(Rover.first.x_coordinate).to eq first_rover.x_coordinate
      expect(Rover.first.y_coordinate).to eq first_rover.y_coordinate
    end

    it 'will move and update rover details' do
      first_rover = Rover.create!(x_coordinate: 1, y_coordinate: 2, direction: 'N', movements: 'LMLMLMLMM' )
      second_rover = Rover.create!(x_coordinate: 3, y_coordinate: 3,direction: 'E', movements: 'MMRMMRMRRM' )
      Plateau.create(width: 5, height: 5)
      first_rover.make_movements
      second_rover.make_movements
      first_rover.reload
      second_rover.reload
      expect(Rover.all.count).to eq 2
      expect(first_rover.x_coordinate).to eq 1
      expect(first_rover.y_coordinate).to eq 3
      expect(first_rover.direction).to eq 'N'
      expect(second_rover.x_coordinate).to eq 5
      expect(second_rover.y_coordinate).to eq 1
      expect(second_rover.direction).to eq 'E'
    end
  end
end