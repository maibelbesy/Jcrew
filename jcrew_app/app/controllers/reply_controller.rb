class ReplyController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    @comment = Comment.create(:post_id => @post.id, :user_id => @current_user.id, :content => params[:comment][:content])
		@reply = CommentJoin.create(:comment_id => @comment.id,:reply_id => @reply.id)
		redirect_to post_path(@post)
	end

end
