Rails.application.routes.draw do

  root to: 'pages#top'

  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :contacts
  resources :sessions
  resources :users
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
