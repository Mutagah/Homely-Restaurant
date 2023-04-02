class UsersController < ApplicationController
   rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
 
   def index
     users = User.all
     render json: users
   end
 
   def show
     user = User.find(params[:id])
     render json: user
   end
 
   def create
     user = User.create!(user_params)
     render json: user, status: :created
   end
 
   def update
     user = find_user
     user.update!(user_params)
     render json: user, status: :accepted
   end
 
   def destroy
     user = find_user
     user.destroy
     head :no_content
   end
 
   private
 
   def user_params
     params.permit(:username, :password, :password_confirmation, :image_url)
   end
 
   def render_unprocessable_entity_response(exception)
     render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
   end
 
   def render_not_found_response
     render json: { errors: ["User not found"] }, status: :not_found
   end
 
   def find_user
     User.find(params[:id])
   end
 end