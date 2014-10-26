class TasksController < ApplicationController
  before_action :authenticate_user!, :set_user_time_zone
  respond_to :html
  def index
    @tasks = {}
    6.times.to_a.each_index do |i|
      @tasks[Date.today - i] = Task.filter_last_n_day(i).order("user_id DESC, created_at DESC")
    end
    respond_with(@tasks)
  end
end
