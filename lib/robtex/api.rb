require 'net/https'
require 'json'

module Robtex
  class API
    HOST = "freeapi.robtex.com".freeze
    URL = "https://#{HOST}".freeze

    def as(q)
      get("/asquery/#{q}") { |body| JSON.parse body }
    end

    def ip(q)
      get("/ipquery/#{q}") { |body| JSON.parse body }
    end

    def rpdns(q)
      get("/pdns/reverse/#{q}") do |body|
        body.lines.map { |line| JSON.parse line }
      end
    end

    def fpdns(q)
      get("/pdns/forward/#{q}") do |body|
        body.lines.map { |line| JSON.parse line }
      end
    end

    def url_for(path)
      URI(URL + path)
    end

    def https_options
      if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
        uri = URI(proxy)
        {
          proxy_address:  uri.hostname,
          proxy_port:     uri.port,
          proxy_from_env: false,
          use_ssl: true
        }
      else
        { use_ssl: true }
      end
    end

    def request(req)
      Net::HTTP.start(HOST, 443, https_options) do |http|
        response = http.request(req)

        case response.code
        when '200' then yield response.body
        when '400' then raise ProcessingError, response.body
        when '401' then raise AuthenticationError, response.body
        when '404' then raise NotFound, response.body
        when '429' then raise RateLimited, response.body
        when '500' then raise InternalServerError, response.body
        else
          raise ResponseError, response.body
        end
      end
    end

    def get(path, &block)
      get = Net::HTTP::Get.new(url_for(path))
      request(get, &block)
    end
  end
end
