Rails.application.routes.draw do

  get 'maps/choose'

  get 'maps/map'

	resources :requests

	root "requests#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
