class BlogController < ApplicationController

	def index
		@posts = Post.all.order('updated_at DESC')
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		redirect_guests
	end

	def create
		hash = params[:post]
		flash[:warning] = []
		flash[:warning] = "Title cannot be left blank" if hash[:title].blank?
		flash[:warning] << "Content cannot be left blank" if hash[:content].blank?
		redirect_to new_post_path and return if flash[:warning].count > 0
		@post = Post.create(:title => hash[:title], :content => hash[:content], :user_id => 1)
		redirect_to post_path(@post.id)
	end

	def edit
		redirect_guests
		@post = Post.find(params[:id])
	end

	def update
		hash = params[:post]
		flash[:warning] = []
		flash[:warning] << "Title cannot be left blank" if hash[:title].blank?
		flash[:warning] << "Content cannot be left blank" if hash[:content].blank?
		redirect_to edit_post_path and return if flash[:warning].count > 0
		Post.find(params[:id]).update(:title => hash[:title], :content => hash[:content], :user_id => 1)
		redirect_to post_path(params[:id])
	end

	def destroy
		Post.delete(params[:id])
		redirect_to posts_path
	end
end
