class Api::V1::TripsController < ApplicationController

  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    render json: @trip
  end

  def events
    trip = Trip.find(params[:id])
    render json: trip.events
  end

  def create
    @trip = Trip.create(trip_params)

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :city, :state, :country, :user_id, :start_date, :end_date)
  end
end
