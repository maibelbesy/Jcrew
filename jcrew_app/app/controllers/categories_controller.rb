class CategoriesController < ApplicationController
  layout false

  def index
    @categories = Category.all
  end

  def new
    # @subject = Category.new({:name => "Default"})
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to(:action => 'index', :id => @category.id)
    else
      render('edit')
    end
  end

  def delete
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.destroy(params[:id])
    redirect_to(:action => 'index')
  end


  private

    def category_params
      params.require(:category).permit(:name)
    end

end
