Ticketee::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :tickets
      end
    end
  end

  namespace :api do
    namespace :v2 do
      resources :projects do
        resources :tickets
      end
    end
  end

  devise_for :users, :controllers => { 
    :registrations => "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  get '/awaiting_confirmation', :to => "users#confirmation", 
    :as => 'confirm_user'

  resources :projects do
    resources :tickets do
      collection do
        get :search
      end

      member do
        post :watch
      end
    end
  end

  resources :tickets do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
  end

  resources :files

  root :to => 'projects#index'

  put '/admin/users/:user_id/permissions',
    :to => 'admin/permissions#update',
    :as => :update_user_permissions
  
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :states  do
      member do
        get :make_default
      end
    end
  end
end
