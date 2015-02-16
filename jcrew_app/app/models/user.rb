class User < ActiveRecord::Base

	# DO NOT ALTER ANYTHING BELOW THIS LINE

	before_save { self.email = email.downcase if not self.email.blank?}

	has_many :posts, foreign_key: "user_id"
	has_many :comments, foreign_key: "user_id"

	# BCrypt is a gem (module/library) that uses a hash function on strings; mainly passwords.
	# When fed a string, hash functions output a fixed-length string that cannot be reversed
	# thus they are optimal for saving passwords

	# To install BCrypt, just run 'install bcrypt' in the terminal followed by 'bundle install'
	# BCrypt handles all things required to hash a string, you can later access the hashed password
	# as an attribute of the User instance, i.e. user.password
	# Comparing a string to the saved password is straightforward, i.e. 'SOME_STRING' == user.password
	# if both hashes match, then the string is equal to the password string

	include BCrypt

	def password
		@password ||= Password.new(password)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password = @password
	end
end
