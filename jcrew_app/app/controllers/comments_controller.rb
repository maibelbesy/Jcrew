class CommentsController < ApplicationController
	def create
    @comment = Comment.create(:post_id => params[:id], :user_id => @current_user.id, :content => params[:comment][:content])
    redirect_to post_path(params[:id])
  end

  def destroy
  	# Comment.find(params[:id]).replies.destroy_all
		# Comment.destroy(params[:id])
  	# comment.replies.delete_all
  	# comment.delete
  	# Comment.delete(params[:id])
  	redirect_to :back
  end

end
