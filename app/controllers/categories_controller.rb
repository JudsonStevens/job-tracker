class CategoriesController < ApplicationController
  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created #{@category.title}!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
