class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
	 	@comment = @post.comments.create(params[:comment].permit(:name, :comment))
		redirect_to post_path(@post)	
	end

	# The method below should be called "destroy", but rails won't let It run for some reason. 
	# Probably because I was basing myself on an older video where the instructor wasn't
	# clear about the rails version. It ended up originating this bug, but I made It work by
	# changing It's name to "show".
	
	def show
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

end
