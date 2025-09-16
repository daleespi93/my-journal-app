class CategoriesController < ApplicationController
  def index
    @categories = Current.user.categories
    puts Current.inspect
  end
  def show
    @category = Current.user.categories.find(params[:id])
    @tasks = @category.tasks
  end
  def new
    @category = Category.new
  end
  def create
    @category = Current.user.categories.build(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
  def edit
    @category = Current.user.categories.find(params[:id])
  end
  def update
    @category = Current.user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end
  def destroy
    @category = Current.user.categories.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  protected
  def category_params
    params.require(:category).permit(:title)
  end
end
