class Post < ActiveRecord::Base

	def self.add_demo
		self.create(:title => 'test', :user_id => User.first.id, :content => 'shaghal!')
	end

	# DO NOT ALTER ANYTHING BELOW THIS LINE

	belongs_to :user#, foreign_key: "user_id"

	has_many :comments, foreign_key: "post_id", dependent: :destroy
	has_many :media, foreign_key: "post_id", dependent: :destroy

	has_many :categories_posts, class_name: "CategoryPost", foreign_key: "post_id", dependent: :destroy
	has_many :categories, through: :categories_posts, source: :category, dependent: :destroy

	accepts_nested_attributes_for :categories
	
	 auto_html_for :content do
  html_escape
  image
  youtube(:width => 400, :height => 250)
  link :target => "_blank", :rel => "nofollow"
  simple_format
   end
	
end
