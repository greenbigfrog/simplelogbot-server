module Discord
  class Discord::Message < ApplicationRecord
    belongs_to :channel
    belongs_to :user

    self.primary_key = 'message_id'
  end
end
