class AccountController < ApplicationController
	# before_action :reroute_user

	def show
		@member = User.find(params[:id])
	end

	def edit
		@member = User.find(params[:id])
	end

	def update
		hash = params[:user]
		# if hash[:name].blank? || hash[:email].blank?
		# 	flash[:notice] = "Name and email cannot be left blank"
		# 	redirect_to user_path(params[:id]) and return
		# end
		flash[:warning] = []
		flash[:warning] << "Name cannot be left blank" if hash[:name].blank?
		flash[:warning] << "Email cannot be left blank" if hash[:email].blank?

		redirect_to user_edit_path(params[:id]) and return if flash[:warning].count > 0

		User.find(params[:id]).update(:name => hash[:name], :email => hash[:email], :about => hash[:about], :signature => hash[:signature], :photo => hash[:photo])
		redirect_to user_path(params[:id])
	end

	private
	def reroute_user
	end
end
