class CategoryPost < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE
	
	self.table_name = "categories_posts"

	belongs_to :post, foreign_key: "post_id"
	belongs_to :category, foreign_key: "category_id"
end
