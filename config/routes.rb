Rails.application.routes.draw do
  root to: "search_actor#step1"

  get '/step1', to: 'search_actor#step1'
  get '/step2', to: 'search_actor#step2'
  get '/step3', to: 'search_actor#step3'
  get '/step4', to: 'search_actor#step4'
  get '/step5', to: 'search_actor#step5'

end
