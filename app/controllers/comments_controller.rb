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

	def edit
	end

	def update
	end


  	def destroy
  		@comment = Comment.find(params[:id])
    	@post = @comment.post

    	if @comment.destroy
			flash[:notice] = "comment was successfully deleted"
		else
			flash[:alert] = "there was a problem"
		end

    	redirect_to post_path(@post.id)
  	end

end
