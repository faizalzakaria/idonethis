class TDData
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "@[production.request] #{json_request(env)}"
    @app.call env
  end

  private

  def json_request(env)
    request = Rack::Request.new(env)
    {
      path: env['PATH_INFO'],
      method: env['REQUEST_METHOD'],
      ip: request.ip,
      user_agent: env['HTTP_USER_AGENT']
    }.to_json

  end
end
