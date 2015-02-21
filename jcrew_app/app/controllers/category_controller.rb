class CategoryController < ApplicationController
	before_action :redirect_non_admins

	def index
		@categories = Category.all
	end

	def create
		Category.create(:name => params[:category][:name])
		redirect_to :back
	end

	def update
		Category.update(params[:id], :name => params[:category][:name])
		redirect_to :back
	end

	def destroy
		Category.destroy(params[:id])
		redirect_to :back
	end

end
