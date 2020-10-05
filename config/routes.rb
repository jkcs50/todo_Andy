Rails.application.routes.draw do
  
  root "todo_lists#index"
  
  resources :todo_lists do
    put :sort
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
