module Discord
  class Discord::Channel < ApplicationRecord
    belongs_to :server
    has_many :messages

    self.primary_key = 'channel_id'
  end
end
