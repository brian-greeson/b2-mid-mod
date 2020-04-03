class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(mechanic_params[:mechanic_id])
  end

private
  def mechanic_params
    params.permit(:mechanic_id)
  end
end
