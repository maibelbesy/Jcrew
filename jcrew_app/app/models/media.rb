class Media < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE
	
	self.table_name = "media"
	belongs_to :post, foreign_key: "post_id"
end
