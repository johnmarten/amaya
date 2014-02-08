require 'http_module'

class Index
  extend WebServiceConsumer

  def self.data
    parsed_response = self.get('http://localhost:5000/api/v1/index.json')
    image = parsed_response['page']['header']['image']
    unless image.nil? || image.starts_with?('http://localhost:5000/')
      parsed_response['page']['header']['image'] = 'http://localhost:5000/' << image
    end
    HashWithIndifferentAccess.new(parsed_response['page'])
  end

end