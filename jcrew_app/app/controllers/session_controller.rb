class SessionController < ApplicationController

	def register
		@user = User.new
	end

	def register_user
		hash = params[:register]
		@user = User.new(:email => hash[:email], :name => hash[:name], :password => hash[:password])
    if @user.save
      log_in @user
      redirect_to posts_path
    else
      render 'register'
    end
	end

	def login
	end

	def login_user
		hash = params[:login]
		user = User.find_by_email(hash[:email])
		if user && user.authenticate(hash[:password])
			log_in user
			redirect_to posts_path
		else
			flash[:warning] = ["Wrong credentials"]
			render 'login'
		end
	end

	def logout
		log_out
		redirect_to :back
	end

end
