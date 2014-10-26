class GithubController < ActionController::Base
  def payload
    Github::Payload.new(request.body.read).generate_details
    render status: 200, json: @controller.to_json
  end
end
