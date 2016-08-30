module Discord
  class Discord::Message < ApplicationRecord
    belongs_to :channel
    belongs_to :user
  end
end
