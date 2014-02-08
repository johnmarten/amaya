class GamesController < ApplicationController

  def index
    @data = Index.data
    @games = []
    game_list = @data[:content][:games]
    game_list.each do |hash|
      @games << Game.new(id: hash[:id], name: hash[:name])
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
