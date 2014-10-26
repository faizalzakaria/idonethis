class GithubController < ActionController::Base
  def webhook
    puts "#{params}"
    render status: 200, json: @controller.to_json
  end
end
