class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		Comment.create(body: params[:comment][:body], user_id: current_user.id, post: @post)
		redirect_to @post, notice: "New comment created."
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		@post = @comment.post
		redirect_to @post, notice: "Comment deleted."
	end
end