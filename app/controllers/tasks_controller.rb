class TasksController < ApplicationController
  before_action :authenticate_user!, :set_user_time_zone
  respond_to :html
  def index
    @tasks = Task.filter_last_n_day(0).order("user_id DESC, created_at DESC")
    respond_with(@tasks)
  end
end
