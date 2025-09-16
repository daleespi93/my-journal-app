class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end
  def new
    @category = Category.new
  end
  def create
    @user = User.find(params[:id])
    @category = @user.categories.build(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end
  def destroy
  end

  protected
  def category_params
    params.require(:category).permit(:user_id, :title)
  end
end
