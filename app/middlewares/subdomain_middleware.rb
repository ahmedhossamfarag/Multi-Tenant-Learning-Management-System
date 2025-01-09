# frozen_string_literal: true

class SubdomainMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    subdomain = request.host.split(".").first

    # Set the subdomain in the request environment for later use
    env["subdomain"] = subdomain

    begin
      if Schema.exists? subdomain
        Schema.open subdomain
      else
        Schema.public
      end

      @app.call(env)

    rescue ArgumentError
      [ 400, { "Content-Type" => "text/plain" }, [ "Bad Request" ] ]
    end
  end

end
