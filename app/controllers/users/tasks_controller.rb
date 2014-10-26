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
    if @task.user == current_user
      respond_with(@user, @task)
    else
      flash[:error] = "#{params[:user_id] == current_user.id} You are not allowed to do the requested action"
      redirect_to root_path
    end
  end

  def edit
    respond_with(@user, @task)
  end

  def create
    @task = @user.tasks.new(task_params)
    if @task.user == current_user
      @task.save
      redirect_to user_tasks_url(@user)
    else
      flash[:error] = "#{params[:user_id] == current_user.id} You are not allowed to do the requested action"
      redirect_to root_path
    end
  end

  def update
    @task.update(task_params)
    respond_with(@user, @task)
  end

  def destroy
    @task.destroy
    respond_with(@user, @task)
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
    unless @task.user == current_user
      flash[:error] = "You are not allowed to do the requested action"
      redirect_to root_path
    end
  end

  def task_params
    params.require(:task).permit(:user_id, :details)
  end

end
