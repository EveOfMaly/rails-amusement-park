class RidesController < ApplicationController

    def index 
        @rides = Ride.all
    end

    def create 
        @attraction = Attraction.find_by(id: params[:attraction])
        @user = current_user
        @ride = Ride.new(user: @user, attraction: @attraction)
        
        
        if (@user.tickets < @attraction.tickets) && (@user.height < @attraction.min_height)
            flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
            redirect_to user_path(@user)
        elsif @user.tickets < @attraction.tickets
            flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}." 
            redirect_to user_path(@user)
        elsif @user.height < @attraction.min_height 
            flash[:message] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
            redirect_to user_path(@user)
        else
            @ride.take_ride
            flash[:message] = "Thanks for riding the #{@attraction.name}!"
            redirect_to user_path(@user)
        end

    end


end
