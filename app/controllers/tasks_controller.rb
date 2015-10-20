class TasksController < ApplicationController
  before_action :authenticate_user!, :set_user_time_zone
  load_and_authorize_resource

  respond_to :html
  def index
    week = params[:page] || 0  # 0 for current week

    @tasks = {}
    (0..6).each_with_index do |i|
      @tasks[Date.today - (week * 7 + i)] = Task.filter_last_n_day(i).order("user_id DESC, created_at DESC")
    end

    respond_with(@tasks)
  end
end
