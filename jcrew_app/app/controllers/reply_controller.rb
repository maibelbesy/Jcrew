class ReplyController < ApplicationController

	def create
    @comment = Comment.create(:post_id => params[:post_id], :user_id => @current_user.id, :content => params[:reply][:content])
		@reply = CommentJoin.create(:comment_id => params[:comment_id],:reply_id => @comment.id)
		@post = Post.find(params[:post_id])
		redirect_to post_path(@post)
	end

def preview
  reply = Reply.new(params[:reply])
  render :text => reply.content_html
end

end
