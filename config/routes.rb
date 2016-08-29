Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      scope '/servers' do
        resources :api_servers, only: [:new, :update]
        scope '/channels' do
          resources :api_channels, only: [:new, :update]
          scope '/messages' do
            resources :api_messages, only: [:new, :update]
          end
        end
      end
      scope '/users' do
        resources :api_users, only: [:new, :update]
        scope '/memberships' do
          resources :api_memberships, only: [:new, :update]
        end
      end
    end
  end
end
