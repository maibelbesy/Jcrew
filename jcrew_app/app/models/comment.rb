class Comment < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE

	belongs_to :user, foreign_key: "user_id"
	belongs_to :post, foreign_key: "post_id"

	has_many :comments_join, class_name: "CommentJoin", foreign_key: "comment_id", dependent: :destroy
	has_many :replies, through: :comments_join, source: :reply, dependent: :delete_all

	has_many :replies_join, class_name: "CommentJoin", foreign_key: "reply_id"
	has_many :comment, through: :replies_join, source: :comment
	
	auto_html_for :content do
  html_escape
  image
  youtube(:width => 400, :height => 250)
  link :target => "_blank", :rel => "nofollow"
  simple_format
   end
	
	
	
end
