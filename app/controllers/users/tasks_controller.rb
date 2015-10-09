class Users::TasksController < Users::BaseController
  respond_to :html
  before_action :set_user
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = @user.tasks
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@user, @task)
  end

  def new
    @task = @user.tasks.new
    verify_task_belongs_to_user do
      respond_with(@user, @task)
    end
  end

  def edit
    respond_with(@user, @task)
  end

  def create
    @task = @user.tasks.new(task_params)
    verify_task_belongs_to_user do
      if @task.save
        flash[:notice] = "Successfully created the task"
        puts "successful"
        redirect_to tasks_url
      else
        flash[:error] = "Failed to create the task"
        flash[:alert] = "Failed to create the task"
        flash[:notice] = "Failed to create the task"
        redirect_to new_user_task_url
      end
    end
  end

  def update
    @task.update(task_params)
    flash[:notice] = "Successfully updated the task"
    redirect_to tasks_url
  end

  def destroy
    @task.destroy
    flash[:notice] = "Successfully destroyed the task"
    redirect_to tasks_url
  end

  private

  def set_all
    set_user
    set_task
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_task
    @task = Task.find(params[:id])
    verify_task_belongs_to_user
  end

  def verify_task_belongs_to_user
    if @task.user == current_user
      yield if block_given?
    else
      flash[:error] = "You are not allowed to do the requested action"
      redirect_to tasks_url
    end
  end

  def task_params
    params.require(:task).permit(:user_id, :details, :task_date)
  end

end
