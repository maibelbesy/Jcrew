class MainController < ApplicationController

	def home
	end

	def team
		@team = User.all.where(:is_admin => true)
	end

end
