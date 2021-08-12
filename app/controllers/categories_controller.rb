class CategoriesController < ApplicationController

  skip_before_action :authenticate_user!

  def home
  end

  def index
    @categories = Category.all
  end

  def show
    @categoria = Category.find(params[:id])
  end
end
