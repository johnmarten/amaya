require "spec_helper"

describe GamesController do
  describe "routing" do

    it "routes to #index" do
      get("/games").should route_to("games#index")
    end

    it "routes to #show" do
      get("/games/1").should route_to("games#show", :id => "1")
    end

  end
end
