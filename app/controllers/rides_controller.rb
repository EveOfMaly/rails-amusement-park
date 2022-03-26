class RidesController < ApplicationController

    def index 
        @rides = Ride.all
    end

    def new 
    end

    def create 
        binding.pry
    end


end
