class AttractionsController < ApplicationController
  def index 
    @attractions = Attraction.all
  end
  
  def new
    @attraction = Attraction.new
  end

  def create 
  
    @attraction = Attraction.new(attraction_params)

    if @attraction.save 
      redirect_to user_path(current_user)
    else 
      render :new
    end
  end

  def show 
    @attraction = Attraction.find_by(params[:id])
  end


  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
