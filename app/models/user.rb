class User < ApplicationRecord
  has_many :members, inverse_of: :user
  has_many :servers, through: :members
end
