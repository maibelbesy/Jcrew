class CommentJoin < ActiveRecord::Base
	
	# DO NOT ALTER ANYTHING BELOW THIS LINE

	self.table_name = "comments_join"

	belongs_to :comment, foreign_key: "comment_id"
	belongs_to :reply, class_name: "Comment", foreign_key: "reply_id"
	
	  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
   end
	
end
