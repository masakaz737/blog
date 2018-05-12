Rails.application.routes.draw do

  root to: 'pages#top'

 resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :contacts

end
