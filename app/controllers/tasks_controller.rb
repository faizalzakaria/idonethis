class TasksController < ApplicationController
  before_action :authenticate_user!, :set_user_time_zone
  respond_to :html
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end
end
