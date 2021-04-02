Rails.application.routes.draw do
  root to: "search_actor#step1"
  
  post 'dispatch', to: 'search_actor#dispatch_post', as: "dispatch"
  
  get 'recommendations/:movie_title', to: 'recommendations#recommendations', as: 'recommendations'
  
  post 'recognition', to: 'facial_recognition#search', as: 'recognition'
  
  get 'actor/:id', to: 'search_actor#show_actor', as: :show_actor
  
  get '/', to: 'search_actor#step1', as: :step1
  get ':id1', to: 'search_actor#step2', as: :step2 
  get ':id1/:id2', to: 'search_actor#step3', as: :step3
  
end
