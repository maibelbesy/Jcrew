class CommentsController < ApplicationController
	def create

    @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    @comment = Comment.create(:post_id => @post.id, :user_id => @current_user.id, :content => params[:comment][:content])
    

    redirect_to post_path(@post)
  end
 
  # private
  #   def comment_params
  #     params.require(:comment).permit(:commenter,:body)
  #   end
end
