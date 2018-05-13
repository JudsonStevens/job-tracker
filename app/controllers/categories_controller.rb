class CategoriesController < ApplicationController
  def index
    @catagories = Categories.all
  end
  
end