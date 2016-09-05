module Discord
  class Discord::User < ApplicationRecord
    has_many :members, inverse_of: :user
    has_many :servers, through: :memberships
    has_many :messages

    self.primary_key = 'user_id'
  end
end
