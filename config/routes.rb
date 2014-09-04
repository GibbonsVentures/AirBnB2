Rails.application.routes.draw do
  devise_for :users
	
	resources :places do
    resources :pictures
    
	end


	resources :reviews, only: [:create]
		
	resources :reservations do
    member do
      post 'reject'
      post 'accept'
    end
  end

  
  

  root "places#index"
  get "faq" => "pages#faq"
  get "status" => "pages#status"
  get "home" => "pages#home"

end
