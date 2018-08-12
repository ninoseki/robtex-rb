# Robtex-rb

[![Build Status](https://travis-ci.org/ninoseki/robtex-rb.svg?branch=master)](https://travis-ci.org/ninoseki/robtex-rb)
[![Maintainability](https://api.codeclimate.com/v1/badges/b5bba652a09c7ef1aa57/maintainability)](https://codeclimate.com/github/ninoseki/robtex-rb/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/robtex-rb/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/robtex-rb?branch=master)

Ruby client for the Robtex API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robtex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install robtex

## Usage

**As a Library**

```rb
require 'robtex'

api = Robtex::API.new
puts api.ip("199.19.54.1")
# => {"status"=>"ok", ...}
puts api.as("1234")
# => {"status"=>"ok", ...}
puts api.rpdns("a.iana-servers.net")
# => [{"rrname"=>"icannalac.com", "rrdata"=>"a.iana-servers.net", "rrtype"=>"NS", "time_first"=>1440957502, "time_last"=>1526778684, "count"=>2}, ...]
puts api.fpdns("a.iana-servers.net")
# => [{"rrname"=>"a.iana-servers.net", "rrdata"=>"2001:500:8c::53", "rrtype"=>"AAAA", "time_first"=>1441242410, "time_last"=>1460542918, "count"=>18}, ...]
```

**As a CLI**

```sh
$ robtex
Commands:
  robtex as [QUERY]      # Query for AS by [QUERY]
  robtex fpdns [QUERY]   # Query for forward PDNS by [QUERY]
  robtex help [COMMAND]  # Describe available commands or one specific command
  robtex ip [QUERY]      # Query for IP by [QUERY]
  robtex rpdns [QUERY]   # Query for reverse PDNS by [QUERY]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

