class TasksController < ApplicationController
  
  def index
    if params[:hidden]
      @tasks = Task.where(user_id: @logged_in_user, complete: false).order(due_by: :asc)
    else
      @tasks = Task.where(user_id: @logged_in_user).order(due_by: :asc)
    end
  end

  def create
    task = Task.new(task_params)
    task.complete = false
    if task.save
      redirect_to '/tasks'
    else
      flash[:errors] = task.errors.full_messages
      redirect_to '/tasks/new'
    end
  end

  def update
    task = Task.find_by_id(params[:id])
    task.complete ? task.complete = false : task.complete = true
    if task.save
      redirect_to '/tasks'
    else
      flash[:errors] = task.errors.full_messages
      redirect_to '/tasks'
    end
  end


  def new
   
  end

  private

  def task_params
    params.require(:task).permit(:content, :due_by).merge(user: logged_in_user)
  end
end
