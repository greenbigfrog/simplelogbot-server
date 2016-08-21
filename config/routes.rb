Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      scope '/servers' do
        # CRUD
        scope '/channels' do
          # CRUD
          scope '/messages' do
            # CRUD
          end
        end
      end
      scope '/users' do
        # CRUD
        scope '/memberships' do
          # CRUD
        end
      end
    end
  end
end
