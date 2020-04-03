class ParksController < ApplicationController

  def show
    @park = Park.find(park_params[:park_id])
  end

private
  def park_params
    params.permit(:park_id)
    # code
  end
end
