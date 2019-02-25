class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: 'Attraction was successfully created.' }
    else
      render :new
    end
  end

  private
    def attraction_params
      params.require(:attraction).permit(
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_rating
      )
    end
end
