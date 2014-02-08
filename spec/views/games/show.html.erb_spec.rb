require 'spec_helper'

describe 'games/show' do
  before(:each) do
    assign(:game, mock_model(Game) do |game|
      game.stub(:name).and_return('Game 1')
      game.stub(:image).and_return('images/game1.jpg')
      game.stub(:description).and_return('Game 1 is an amazing game')
    end)
  end

  describe 'header' do
    it 'renders some text' do
      render
      rendered.should have_selector('header h2', text: view_assigns[:game].name)
    end

    it 'renders an image' do
      render
      rendered.should have_selector("header img[src='#{view_assigns[:game].image}']")
    end
  end

  describe 'content' do
    it 'renders a description' do
      render
      rendered.should have_selector('article p', text: view_assigns[:game].description)
    end
  end

end
