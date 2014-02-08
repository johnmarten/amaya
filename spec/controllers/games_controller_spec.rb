require 'spec_helper'

describe GamesController do

  describe 'GET index' do
    data =
        HashWithIndifferentAccess.new({header: {text: 'Gamers heaven',
                                                   image: 'images/header.jpg'},
                                          content: {main_text: 'Welcome to this gaming site',
                                                    games: [{id: 1, name: 'Superheroes 1',
                                                             url: '/api/v1/games/1.json'},
                                                            {id: 2, name: 'Rally 2.0',
                                                             url: '/api/v1/games/2.json'},
                                                            {id: 3, name: 'Birds birds v2014',
                                                             url: '/api/v1/games/3.json'}]}})

    it 'assigns data to @data' do
      Index.should_receive(:data).and_return(data)
      get :index
      assigns(:data).should eq(data)
    end

    it 'assigns all games as @games' do
      Index.should_receive(:data).and_return(data)

      get :index

      assigns(:games).size.should == 3
      assigns(:games).each do |game|
        game.should be_a(Game)
      end
      assigns(:games).first.id.should == data[:content][:games].first[:id]
      assigns(:games).second.id.should == data[:content][:games].second[:id]
      assigns(:games).third.id.should == data[:content][:games].third[:id]
      assigns(:games).first.name.should == data[:content][:games].first[:name]
      assigns(:games).second.name.should == data[:content][:games].second[:name]
      assigns(:games).third.name.should == data[:content][:games].third[:name]


    end
  end

  describe 'GET show' do
    it 'assigns the requested game as @game' do
      game = mock_model(Game)
      Game.should_receive(:find).with(game.to_param).and_return(game)
      get :show, { id: game.to_param }
      assigns(:game).should eq(game)
    end
  end

end
