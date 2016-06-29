Rails.application.routes.draw do
  post ':user_id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  resources :roles
  #devise routes an the controller to handle omniauth callbacks
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  #route to user's profile page
  

  resources :groups do
    resources :group_posts do
      resources :images
      resources :texts
      resources :videos
    end
    member do
      get 'join', to: "groups#join"
      get 'leave', to: "groups#leave"
    end
  end
  resources :forums do
    member do
      get 'like', to: "forums#upvote"
    end
  	resources :comments 
    collection do
      get :recent
      get :trending
      get :unanswered
    end
  end
  get 'like_comment' ,  to: "comments#upvote"
  
  root to: "articles#index"
  resources :articles do
    member do
      get 'like', to: "articles#upvote"
    end
  	resources :comments
    collection do
      get :recent
      get :trending
    end
  end
  resources :diaries do 
    resources :comments
    member do
      get 'like', to: "diaries#upvote"
    end
  end
  get ':user_id', to: 'profiles#show', as: :profile
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
end
