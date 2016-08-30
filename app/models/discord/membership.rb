module Discord
  class Discord::Membership < ApplicationRecord
    belongs_to :server, inverse_of :members
    belongs_to :user, inverse_of :members
  end
end
