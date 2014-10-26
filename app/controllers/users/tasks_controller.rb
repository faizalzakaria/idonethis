class Users::TasksController < Users::BaseController
  respond_to :html
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
    respond_with(@tasks)
  end

  def show
    respond_with(current_user, @task)
  end

  def new
    @task = Task.new
    respond_with(current_user, @task)
  end

  def edit
    respond_with(current_user, @task)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    current_user.tasks << @task
    redirect_to user_tasks_url(current_user)
  end

  def update
    @task.update(task_params)
    respond_with(current_user, @task)
  end

  def destroy
    @task.destroy
    respond_with(current_user, @task)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:user_id, :details)
  end
end
