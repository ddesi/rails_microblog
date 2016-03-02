class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
	end

	def new
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
		@post = Post.find(params[:id])
	end

end
