require 'sinatra'
require 'json'

SERVER = "http://localhost:5000/"
API = "/api/v1/"

before do
    content_type :json
end

get(API + 'index.json') do
    {
        page: {
            header: {
                text: "Gamers heaven",
                image: "images/header.jpg"
            },
            content:{
                main_text: "Welcome to this gaming site, as you see it is very interesting and full of content",
                games: [
                    {
                        id: 1,
                        name: "Superheroes 1",
                        url: API + "games/1.json"
                    },
                    {
                        id: 2,
                        name: "Rally 2.0",
                        url: API + "games/2.json"
                    },
                    {
                        id: 3,
                        name: "Birds birds v2014",
                        url: API + "games/3.json"
                    }
                ]
            },
            footer: {
                text: "2014. Heyho"
            }

        }
    }.to_json
end

get(API + "games/1.json") do
    {page: {
            header: {
                id: 1,
                text: "Superheroes 1",
                image: "images/game1.jpg"
            },
            content:{
                main_text: "Superheroes is an amazing fight game",
            }
        }
    }.to_json
end

get(API + "games/2.json") do
    {page: {
            header: {
                id: 2,
                text: "Rally 2.0",
                image: "images/game2.jpg"
            },
            content:{
                main_text: "Joe says 'play Rally 2.0'",
            }
        }
    }.to_json
end

get(API + "games/3.json") do
    {page: {
            header: {
                id: 3,
                text: "Birds birds v2014",
                image: SERVER + "images/game3.jpg"
            },
            content:{
                main_text: "Birds birds is the best game according to Gamish magazine",
            }
        }
    }.to_json
end