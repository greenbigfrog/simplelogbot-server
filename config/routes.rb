Rails.application.routes.draw do
  devise_for :users
  scope '/api' do
    scope '/v1' do
      put '/status' => 'status#update'
      scope '/servers' do
        resources :api_server, only: [:create, :update]
        scope '/channels' do
          resources :api_channel, only: [:create, :update]
          scope '/messages' do
            resources :api_message, only: [:create, :update]
          end
        end
      end
      scope '/users' do
        resources :api_user, only: [:create, :update]
        scope '/memberships' do
          resources :api_membership, only: [:create, :update]
        end
      end
    end
  end
end
