class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@post = Post.where(user_id: current_user).create(params[:post])
		@post.user_id = current_user
		redirect_to posts_path
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
    	@post.update(params[:post])
    	@user = @post.user

    	redirect_to posts_path
    	# or also to user_path(@post.user_id)
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "post was successfully deleted"
		else
			flash[:alert] = "there was a problem"
		end
		redirect_to :back
	end

	def show
		@post = Post.find(params[:id])
		@user = @post.user
  		# @posts = @user.posts
  		# im saying find the post in the db and for that post get all the comments of that post
  		@comment = Comment.new
  		@comments = @post.comments
	end

	private
	def post_params
		params.require(:post).permit(:body, :user_id, :title)
	end

end

