class LandingPagesController < ApplicationController
  respond_to :html
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end
end
