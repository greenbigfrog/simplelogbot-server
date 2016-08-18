class Server < ApplicationRecord
  has_many :members, inverse_of: :server
  has_many :users, through: :members

  has_many :channels
end
