require 'http_module'

class Game
  include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::Serializers
  include ActiveModel::Validations

  extend WebServiceConsumer


  class_attribute :_attributes
  self._attributes = []

  def self.attributes(*names)
    attr_accessor *names
    self._attributes += names
  end

  attributes :id, :name, :image, :description

  validates_presence_of :id, :name

  def initialize(attr={})
    self.id = attr[:id]
    self.name = attr[:name]
    self.image = attr[:image]
    self.description = attr[:description]
  end

  def attributes
    self._attributes.inject({}) do |hash, attr|
      hash[attr.to_s] = send(attr)
      hash
    end
  end

  def to_model
    self
  end

  def persisted?
    false
  end

  def self.find(id)
    parsed_response = self.get("http://localhost:5000/api/v1/games/#{id}.json")
    game = parsed_response['page']
    image = game['header']['image']

    unless image.nil? || image.starts_with?('http://localhost:5000/')
      game['header']['image'] = 'http://localhost:5000/' << image
    end

    Game.new(id: game['header']['id'],
             name: game['header']['text'],
             image: game['header']['image'],
             description: game['content']['main_text'])
  end

end
