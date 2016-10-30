class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created new category"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    category = Category.find(params[:id])
    category.delete

    flash[:success] = "#{category.name} was successfully deleted!"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
