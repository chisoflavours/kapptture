Rails.application.routes.draw do

  devise_for :creators
  resources :creators
  
  authenticated :creator do
    root :to => 'pages#dashboard', as: :authenticated_root
  end
   
  root :to => 'kapps#index'
  
  resources :kapps do
    member do
      get "like", to: "kapps#upvote"
      get "dislike", to: "kapps#downvote"
    end
    resources :comments
  end
  
end
