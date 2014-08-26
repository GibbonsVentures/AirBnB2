Rails.application.routes.draw do
  devise_for :users
	
resources :places do
    resources :pictures
end

	resources :reservations, only: [:create]
	resources :reviews, only: [:create]
		
	

  


  root "places#index"
  get "faq" => "pages#faq"
  get "home" => "pages#home"

end
