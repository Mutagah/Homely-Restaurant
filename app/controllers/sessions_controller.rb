class SessionsController < ApplicationController
    def create
      user = User.find_by(username: user_login_params[:username])
      if user&.authenticate(user_login_params[:password])
        session[:user_id] = user.id
        render json: user, status: :created
      else
        puts "DEBUG: Authentication failed for username #{user_login_params[:username]}"
        render json: { errors: ["Invalid password or username"] }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete(:user_id)
      head :no_content
    end

    private 
    def user_login_params
      params.permit(:username, :password)
    end
  end