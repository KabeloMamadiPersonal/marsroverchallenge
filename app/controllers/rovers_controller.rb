class RoversController < ApplicationController

  def new

  end
  def create
    Rover.create!(rover_params)
    redirect_to new_rover_path
  end

  def rover_params
    params.require(:rover).permit(:x_coordinate, :y_coordinate, :direction, :movements)
  end
end