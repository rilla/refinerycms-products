::Refinery::Application.routes.draw do
  
  resources :corporate_pages, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :corporate_pages, :except => :show do
      collection do
        post :update_positions
      end
      member do
        get :children
      end
    end
  end

  resources :products, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :products, :except => :show do
      collection do
        post :update_positions
        get :tokens
      end
      member do
        get :children
      end
    end
  end

  resources :facets, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :facets, :except => :show do
      collection do
        post :update_positions
        get :tokens
      end
      member do
        get :children
      end
    end
  end
  
end
