Rails.application.routes.draw do
  #devise_for :users
  scope '/api' do
    scope '/v1' do
      put '/status' => 'status#update'
      scope '/servers' do
        resources :api_server, path: '/', only: [:create, :update]
      end
      scope '/channels' do
        resources :api_channel, path: '/', only: [:create, :update]
      end
      scope '/messages' do
        resources :api_message, path: '/', only: [:create, :update]
      end
      scope '/users' do
        resources :api_user, path: '/', only: [:create, :update]
      end
      scope '/memberships' do
        resources :api_membership, path: '/', only: [:create, :update]
      end
    end
  end
end
