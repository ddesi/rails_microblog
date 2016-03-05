class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.where(email: params[:user][:email]).first
		if @user && @user.password == params[:user][:password]
			# this line is actually what logs you in:
			session[:user_id] = @user.id
			flash[:notice] = "You have successfully signed in!"
			redirect_to user_path @user
		else
			flash[:alert] = "There was a problem with the login. Please try again"
			redirect_to sessions_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have successfully signed out!"
		redirect_to "/"
	end
end
