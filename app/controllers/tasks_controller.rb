class TasksController < ApplicationController
   before_action :set_category

  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Current.user.categories.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end
end
