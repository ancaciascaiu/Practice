Rails.application.routes.draw do
  get 'opinions/show'

  get 'opinions/:name', to: 'opinions#show'
  root to: 'opinions#show'
end
