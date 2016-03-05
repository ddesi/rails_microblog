class CommentsController < ApplicationController
	def create
		@comment = Comment.create(params[:comment])
		# >> bc you have post id user id
		@post = @comment.post
		@user = @post.user

		redirect_to post_path(@post.id)
	end

	def new
		@comment = Comment.new
	end

	def show
		@comment = Comment.find(params[:id])
    	@post = @comment.post
    	@user = @comment.user
	end

end
