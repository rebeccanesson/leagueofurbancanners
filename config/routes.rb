Lurc::Application.routes.draw do
  
  mount Locomotive::Engine => '/locomotive', :as => 'locomotive' # you can change the value of the path, by default set to "/locomotive"

  resources :prunings
  resources :cannings
  resources :canning_sessions
  resources :harvestings
  resources :harvests
  resources :status_checks
  resources :fruit_trees
  resources :fruits
  resources :sites do 
    collection do
        get 'map'
    end
  end

  resources :people do 
    member do 
        get 'merge'
        post 'commit_merge'
    end  
  end

  devise_for :users
  resources :users, :only => [:edit, :update]

  root :to => 'sites#index'
end
