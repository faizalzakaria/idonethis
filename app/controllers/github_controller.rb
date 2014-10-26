class GithubController < ActionController::Base
  def payload
    puts "#{JSON.parse(request.body.read).keys}"
    render status: 200, json: @controller.to_json
  end
end
