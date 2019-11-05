Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  api_version(:module => "api/v1", path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :book_suggestions,  only: %i[create]
    
    resources :books,  only: %i[index show] do
      collection do
        get '/search_book' => 'books#search_book', as: "search_book"
      end
    end

    resources :users, :only => [] do
      resources :rents,  only: %i[index create]
    end
  end
end
