class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #skip_before_action :authorize
  
    def index
      restaurant = Restaurant.all
      render json: restaurant, status: :ok
    end
  
    def show
      restaurant = Restaurant.find(params[:id])
      render json: restaurant, serializer: RestaurantSerializer, status: :ok
    end
  
    private
  
    def render_not_found_response
      render json: { errors: ["Restaurant not found"]}, status: :not_found
    end
  end