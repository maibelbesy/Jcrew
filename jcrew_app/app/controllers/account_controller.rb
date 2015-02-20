class AccountController < ApplicationController
	# before_action :redirect_guests

	def show
		@member = User.find(params[:id])
	end

	def edit
		redirect_guests
		@member = User.find(params[:id])
	end

	def update
		hash = params[:user]
		flash[:warning] = []
		flash[:warning] << "Name cannot be left blank" if hash[:name].blank?
		flash[:warning] << "Email cannot be left blank" if hash[:email].blank?

		redirect_to user_edit_path(params[:id]) and return if flash[:warning].count > 0

		User.find(params[:id]).update(:name => hash[:name], :email => hash[:email], :about => hash[:about], :signature => hash[:signature], :photo => hash[:photo])
		redirect_to user_path(params[:id])
	end
end
