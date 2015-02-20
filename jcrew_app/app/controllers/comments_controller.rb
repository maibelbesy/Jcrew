class CommentsController < ApplicationController
	def create
    @comment = Comment.create(:post_id => params[:id], :user_id => @current_user.id, :content => params[:comment][:content])
    redirect_to post_path(params[:id])
  end
end
