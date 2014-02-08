require 'httparty'

module WebServiceConsumer
  extend HTTParty

  def get(path)
    response = HTTParty.get(path)
    response.parsed_response
  end
end