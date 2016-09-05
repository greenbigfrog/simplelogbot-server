module Discord
  class Discord::Server < ApplicationRecord
    has_many :memberships, inverse_of: :server
    has_many :users, through: :memberships

    has_many :channels

    self.primary_key = 'server_id'
  end
end
