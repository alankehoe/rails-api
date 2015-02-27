# Used to transform json responses
module JsonHelper
  # Parse the response body to get a json object
  # this can be called in any test where there is a http response.
  def json
    @json ||= JSON.parse(response.body)
  end
end