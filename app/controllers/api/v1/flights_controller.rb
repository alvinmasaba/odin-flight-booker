class API::V1::FlightsController < ApplicationController
  def index
    render :json => Flight.all
  end
end