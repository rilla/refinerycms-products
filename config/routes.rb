::Refinery::Application.routes.draw do
  
  resources :corporate_pages, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :corporate_pages, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  resources :products, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :products, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

end
