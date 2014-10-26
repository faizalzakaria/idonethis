class Users::BaseController < ApplicationController
  before_action :authenticate_user!, :set_user_time_zone
  load_and_authorize_resource
end
