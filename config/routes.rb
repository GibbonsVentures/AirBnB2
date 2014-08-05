Rails.application.routes.draw do
  devise_for :users
	resources :reservations
	resources :places	

  root "places#index"

  get "faq" => "pages#faq"
  get "home" => "pages#home"

end
