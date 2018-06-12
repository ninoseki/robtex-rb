module Robtex
  class ResponseError < StandardError; end

  class AuthenticationError < ResponseError; end

  class NotFound < ResponseError; end

  class ProcessingError < ResponseError; end

  class RateLimited < ResponseError; end

  class InternalServerError < ResponseError; end
end
