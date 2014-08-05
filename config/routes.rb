Rails.application.routes.draw do
	resources :reservations
	resources :places	
  devise_for :users
  root "places#index"

  get "faq" => "pages#faq"
  get "home" => "pages#home"

end
