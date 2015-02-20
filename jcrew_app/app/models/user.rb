class User < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE

	before_save { self.email = email.downcase if not self.email.blank?}

	validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }, :on => :create

	has_many :posts, foreign_key: "user_id"
	has_many :comments, foreign_key: "user_id"

	has_secure_password validations: false
end
