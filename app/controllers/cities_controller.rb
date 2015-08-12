class CitiesController < ApplicationController
  def new
  	@city = City.new
  end

  def create
  	@city = City.new(params.require(:city).permit(:name))
  	@city.save
  end

  def show
  	@city = City.find(params[:id])
  end
end
