class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(mechanic_params[:mechanic_id])
  end

  def update
    @mechanic = Mechanic.find(mechanic_params[:mechanic_id])
    @mechanic.rides << Ride.find(mechanic_params[:ride_id])

    redirect_to "/mechanics/#{@mechanic.id}" 
  end

private
  def mechanic_params
    params.permit(:mechanic_id, :ride_id)
  end
end
