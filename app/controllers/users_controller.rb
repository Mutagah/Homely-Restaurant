class UserController < ApplicationController
rescue from::ActiveRecord: :RecordInvalid, with: :render_uprocessable_entity_response
rescue from::ActiveRecord: :RecordNotFound, with: :render_not_found_response
   wrap_parameters format: []

    user = User.create!(user_params)
    session[:user_id]= user.id
    render json: user, status: :created
end
def show
    user=User.find_by(id: session[:user_id])
render json: user,status: :ok

   private 
   def user_params
    params.permit(:username, :password_digest, :password_confirmation, :image_url)
   end
def render_uprocessable_entity_response(invalid)
   render json:{errors: invalid.record.errors.full_messages}, status: :unproccessable_entity
end
def render_not_found_response
   render json :{errors:["not found"]}, status: :not_found
end