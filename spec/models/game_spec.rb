require 'spec_helper'

describe Game do

  before(:each) do
    @game = Game.new(id: 2, name: 'Name')
  end

  it 'has attributes' do
    @game.attributes.should include('id', 'name', 'image', 'description')
  end

  it 'must have an id' do
    @game.should be_valid
    Game.new(name: 'Name').should_not be_valid
  end

  it 'must have a name' do
    @game.should be_valid
    Game.new(id: 2).should_not be_valid
  end

  it 'responds to +find+' do
    Game.should respond_to(:find)
  end

  it 'returns a specific instance when provided an id' do
    parsed_response = {'page' => {'header' => {'id' => 3,
                                               'text' => 'Birds birds v2014',
                                               'image' => 'http://localhost:5000/images/game3.jpg'},
                                  'content' => {'main_text' => 'Birds birds is the best game according to Gamish magazine'}}}

    Game.should_receive(:get).and_return(parsed_response)

    game = Game.find(3)
    game.should be_a(Game)
    game.id.should == parsed_response['page']['header']['id']
    game.name.should eq(parsed_response['page']['header']['text'])
    game.image.should eq(parsed_response['page']['header']['image'])
    game.description.should eq(parsed_response['page']['content']['main_text'])
  end

  it 'ensures image paths are prefixed with host' do
    parsed_response =
        {'page' => {'header' => {'image' => 'images/game1.jpg'}, 'content' => {}}}

    Game.should_receive(:get).and_return(parsed_response)

    Game.find(1).image.should eq('http://localhost:5000/images/game1.jpg')
  end

end
