Rails.application.routes.draw do
  root to: "search_actor#step1"
  
  get '/', to: 'search_actor#step1', as: :step1
  get ':id1', to: 'search_actor#step2', as: :step2 
  get 'actor/:id', to: 'search_actor#show_actor', as: :show_actor
  get ':id1/:id2', to: 'search_actor#step3', as: :step3

  post '/dispatch', to: 'search_actor#dispatch_post', as: "dispatch"
end
