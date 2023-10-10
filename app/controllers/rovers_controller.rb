class RoversController < ApplicationController

  def new
    @rover = Rover.new
  end
  def create
    @rover = Rover.new(rover_params)
    if @rover.save
      redirect_to new_rover_path
    else
      render 'new'
    end
  end

  def rover_params
    params.require(:rover).permit(:x_coordinate, :y_coordinate, :direction, :movements)
  end
end