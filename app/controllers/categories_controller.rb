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
    @category = Category.find(params[:id])
    @jobs = Job.by_category(params[:id])
  end

  def index
    @categories = Category.all
    @category_count = Job.count_by_category
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = "#{category.title} was successfully deleted!"

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
