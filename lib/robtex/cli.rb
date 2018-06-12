require "thor"

module Robtex
  class CLI < Thor
    desc "ip [QUERY]", "Query for IP by [QUERY]"
    def ip(query)
      with_error_handling do
        res = api.ip(query)
        puts JSON.pretty_generate(res)
      end
    end

    desc "as [QUERY]", "Query for AS by [QUERY]"
    def as(query)
      with_error_handling do
        res = api.as(query)
        puts JSON.pretty_generate(res)
      end
    end

    desc "rpdns [QUERY]", "Query for reverse PDNS by [QUERY]"
    def rpdns(query)
      with_error_handling do
        res = api.rpdns(query)
        puts JSON.pretty_generate(res)
      end
    end

    desc "fpdns [QUERY]", "Query for forward PDNS by [QUERY]"
    def fpdns(query)
      with_error_handling do
        res = api.fpdns(query)
        puts JSON.pretty_generate(res)
      end
    end

    no_commands do
      def api
        API.new
      end

      def with_error_handling
        yield
      rescue ResponseError => e
        puts "Warning: #{e}"
      end
    end
  end
end
