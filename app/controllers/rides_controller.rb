class RidesController < ApplicationController

    def index 
        @rides = Ride.all
    end

    def create 
        @attraction = Attraction.find_by(params[:attraction])
        @user = current_user
        @ride = Ride.new(user: @user, attraction: @attraction)
        @ride.take_ride
        redirect_to user_path(@user)
    end


end
