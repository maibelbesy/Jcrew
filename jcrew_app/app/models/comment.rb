class Comment < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE

	belongs_to :user, foreign_key: "user_id"
	belongs_to :post, foreign_key: "post_id"

	has_many :comments_join, class_name: "CommentJoin", foreign_key: "comment_id"
	has_many :replies, through: :comments_join, source: :reply

	has_many :replies_join, class_name: "CommentJoin", foreign_key: "reply_id"
	has_many :comment, through: :replies_join, source: :comment
end
