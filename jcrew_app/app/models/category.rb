class Category < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE
	
	has_many :categories_posts, class_name: "CategoryPost", foreign_key: "category_id"
	has_many :posts, through: :categories_posts, source: :post
end
