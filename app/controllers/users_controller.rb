class UsersController < ApplicationController
	def index
		if session[:user_id] == nil
			flash[:alert] = "Log in first!"
			redirect_to "/"
		else
			@users = User.all
		end
	end

	def create
		@user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
		if @user.save
			flash[:notice] = "Your account was created successfully. Please log in!"
			redirect_to new_session_path
		else
			flash[:alert] = "There was a problem saving your account."
			redirect_to new_user_path
		end

		# User.create(params[:user])
		# redirect_to new_user_path

		# you can specify which body if you have the same for e.g. comments and posts
		# params[:post][:body]
		# params[:comment][:body]
		# in the html it's post[body]
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
		# has the same code as the show bc they both need to load the info first with the get
		# then you update it with update with a post
	end

	def update
		@user = User.find(params[:id])
		@user.update(params[:user]) 
		# it's automatically getting ALL the params for users from your table (fname, lname etc)

		redirect_to user_path(@user.id)
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "user was successfully deleted"
		else
			flash[:alert] = "there was a problem"
		end
		redirect_to users_path
	end

	def show
		if session[:user_id] == nil
			flash[:alert] = "Log in first!"
			redirect_to "/"
		else
		@user = User.find(params[:id])
		@post = Post.new
		@posts = Post.where(user_id: params[:id])
		end
	end

	def profile
		@user = current_user
		@post = Post.new
		@posts = Post.where(user_id: current_user.id)
	end

end
