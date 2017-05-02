require 'net/https'

module ExternalApiClient
  class << self
    def api_server
      'https://api.example.com'
    end

    def debug?
      true
    end

    def send_request(method, path, params = nil)
      uri = URI.parse(api_server + path)

      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https' || uri.port == 443
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      http.set_debug_output($stderr) if debug?

      request_params = [
        method.to_s.upcase,
        path
      ]

      if params
        case params
        when Hash
          if %w(POST PUT).include? request_params[0]
            request_params << params.to_json
            request_params << { 'Content-Type' => 'application/json' }
          else
            request_params[1] << ( '?' + params.to_param )
          end
        else
          raise NotImplementedError
        end
      end

      http.send_request(*request_params)
    end
  end
end
