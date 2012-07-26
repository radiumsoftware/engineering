require "rack/jekyll"

class DeleteContentLength
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call env
    headers.delete 'Content-length'
    [status, headers, body]
  end
end

use DeleteContentLength
run Rack::Jekyll.new
