class BlogController < ApplicationController

	def index
		@posts = Post.all.order('updated_at DESC')
	end

	def list
		# puts "PARAMS #{params}"
		hash = params[:category]
		selected_categories_array = []
		hash.each{ |k,v|
			if v == 1 || v == '1'
				selected_categories_array << k
			end
		}
		categories = Category.where(:id => selected_categories_array)
		@posts = []
		categories.each{ |category|
			@posts << category.posts.order('updated_at DESC')
		}
		@posts.to_a.flatten!.sort!{|a,b| b.updated_at <=> a.updated_at}
		@posts = @posts.uniq
		render 'index'
	end

	def show
		# redirect_not_published
		@post = Post.find(params[:id])
	end

	def new
		redirect_guests
	end

	def create
		hash = params[:post]
		@post = Post.create(:title => hash[:title], :content => hash[:content], :user_id => @current_user.id)
		if params[:category] != nil
			categories = params[:category]
			selected_categories_array = []
			categories.each{ |k,v|
				if v == 1 || v == '1'
					selected_categories_array << k
				end
			}
			ActiveRecord::Base.transaction do
				selected_categories_array.each {|k| 
					CategoryPost.create(:post_id => @post.id, :category_id => k) if not CategoryPost.exists?(:post_id => @post.id, :category_id => k)
				}
			end
		end

		flash[:warning] = []
		flash[:warning] << "Title cannot be left blank" if hash[:title].blank?
		flash[:warning] << "Content cannot be left blank" if hash[:content].blank?
		redirect_to new_post_path and return if flash[:warning].count > 0
		redirect_to post_path(@post.id)
	end

	def edit
		redirect_guests
		@post = Post.find(params[:id])
	end

	def update
		hash = params[:post]
		if params[:category] != nil
			categories = params[:category]
			selected_categories_array = []
			removed_categores_array = []
			categories.each{ |k,v|
				if v == 1 || v == '1'
					selected_categories_array << k
				elsif v == 0 || v == '0'
					removed_categores_array << k
				end
			}

			CategoryPost.where(:post_id => params[:id], :category_id => removed_categores_array).delete_all
			ActiveRecord::Base.transaction do
			  selected_categories_array.each {|k| 
			  	CategoryPost.create(:post_id => params[:id], :category_id => k) if not CategoryPost.exists?(:post_id => params[:id], :category_id => k)
			   }
			end
		end

		flash[:warning] = []
		flash[:warning] << "Title cannot be left blank" if hash[:title].blank?
		flash[:warning] << "Content cannot be left blank" if hash[:content].blank?
		redirect_to edit_post_path and return if flash[:warning].count > 0
		Post.find(params[:id]).update(:title => hash[:title], :content => hash[:content])
		redirect_to post_path(params[:id])
	end

	def destroy
		Post.delete(params[:id])
		redirect_to posts_path
	end
end
