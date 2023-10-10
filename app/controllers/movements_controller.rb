class MovementsController < ApplicationController

  def new
  end

  def start
    rovers = Rover.all
    rovers.each do |rover|
      rover.make_movements
    end
    @rovers = rovers.reload
  end
end