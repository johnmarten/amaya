require 'spec_helper'

describe 'games/index' do
  before(:each) do
    assign(:data,
           { header: { text: 'Gamers heaven', image: 'images/header.jpg' },
             content: { main_text: 'Welcome to this gaming site' },
             footer: { text: '2014' } })
    assign(:games, [
      mock_model(Game) do |game|
        game.stub(:id).and_return(1)
        game.stub(:name).and_return('Game 1')
      end,
      mock_model(Game) do |game|
        game.stub(:id).and_return(2)
        game.stub(:name).and_return('Game 2')
      end,
      mock_model(Game) do |game|
        game.stub(:id).and_return(3)
        game.stub(:name).and_return('Game 3')
      end
    ])
  end

  describe 'header' do
    it 'renders some text' do
      render
      rendered.should have_selector('header h1',
                                    text: view_assigns[:data][:header][:text])
    end

    it 'renders an image' do
      render
      rendered.should have_selector("header img[src='#{view_assigns[:data][:header][:image]}']")
    end

  end

  describe 'content' do
    it 'renders som text' do
      render
      rendered.should have_selector('article p',
                                    text: view_assigns[:data][:content][:main_text])
    end

    it 'renders a list of games' do
      render
      rendered.should have_selector('article ol li', count: 3)
      rendered.should have_content(view_assigns[:games].first.name)
      rendered.should have_content(view_assigns[:games].second.name)
      rendered.should have_content(view_assigns[:games].third.name)

    end

  end

  describe 'footer' do
    it 'renders some text' do
      render
      rendered.should have_selector('footer', text: view_assigns[:data][:footer][:text])
    end
  end

end
