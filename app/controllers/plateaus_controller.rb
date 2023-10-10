class PlateausController < ApplicationController

  def create
    Plateau.create!(plateau_params)
    redirect_to new_rover_path
  end

  def plateau_params
    params.require(:plateau).permit(:width, :height)
  end
end