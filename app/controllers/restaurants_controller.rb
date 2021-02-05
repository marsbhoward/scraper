class RestaurantsController < ApplicationController
  def index
  	restaurants = Restaurant.all.sort()
  	render json: restaurants
  end

  def new 
  	restaurant = Restaurant.find(restaurant_params[:id])
  end

  def create
  	restaurant = Restaurant.new()
  	render json: restaurant
  end


  def show
    restaurant = Restaurant.find(restaurant_params[:id])
    render json: restaurant
  end

  def restaurant_params
    params.permit(:id,:name)
  end  
  
end
