module Discord
  class Discord::Membership < ApplicationRecord
    belongs_to :server, inverse_of: :memberships
    belongs_to :user, inverse_of: :memberships
  end
end
