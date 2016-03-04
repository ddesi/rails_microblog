class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@post = Post.where(user_id: current_user).create(params[:post])

		# not working!! redirect_to user_path(params[:post][:user_id])
		redirect_to posts_path
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def update
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "post was successfully deleted"
		else
			flash[:alert] = "there was a problem"
		end
		redirect_to posts_path
	end

	def show
		# @post = Post.find(params[:id])
		@user = current_user
  		@posts = @user.posts
	end

end
