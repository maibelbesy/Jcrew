class Post < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE

	belongs_to :user, foreign_key: "user_id"

	has_many :comments, foreign_key: "post_id", dependent: :destroy
	has_many :media, foreign_key: "post_id", dependent: :destroy

	has_many :categories_posts, class_name: "CategoryPost", foreign_key: "post_id"
	has_many :categories, through: :categories_posts, source: :category
end
