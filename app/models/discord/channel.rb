module Discord
  class Discord::Channel < ApplicationRecord
    belongs_to :server
    has_many :messages
  end
end
