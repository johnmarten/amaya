Amaya::Application.routes.draw do
  resources :games, only: [:index, :show]

  root to: 'games#index'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
end
