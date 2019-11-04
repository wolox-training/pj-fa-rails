Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  api_version(:module => "api/v1", path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :books,  only: %i[index show]
    get '/open_library' => 'books#open_library', as: "open_library"
    resources :book_suggestions,  only: %i[create]

    resources :users, :only => [] do
      resources :rents,  only: %i[index create]
    end
  end
end
