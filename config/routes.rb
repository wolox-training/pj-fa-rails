Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.mycompany.com; version=1"}) do
    resources :books,  only: %i[index show] 
  end

end
