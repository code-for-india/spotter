Spotter::Application.routes.draw do
  apipie
  resources :issues
  get 'issues/:id/:lat/:lng/' => 'issues#show'
  get '/issues/:lat/:lng/:area' => 'issues#index'
end
