Rails.application.routes.draw do
  resources :mall do
    member do
      get 'manage'
      patch 'upload_directory'
      get 'download_as_txt'
      get 'download_as_csv'
    end
    resources :shops, only: :create
  end  

  resources :shops, only: [:update, :destroy]

  root :to => "mall#show", :id => '1'
end
