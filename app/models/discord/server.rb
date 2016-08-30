module Discord
  class Discord::Server < ApplicationRecord
    has_many :memberships, inverse_of: :server
    has_many :users, through: :members

    has_many :channels
  end
end
