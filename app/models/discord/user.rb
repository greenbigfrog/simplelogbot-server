module Discord
  class Discord::User < ApplicationRecord
    has_many :members, inverse_of: :user
    has_many :servers, through: :memberships
    has_many :messages

    self.primary_key = 'user_id'

    def self.ensure_user(user_id)
      raise 'pass in a user ID' unless user_id
      @user = Discord::User.find_by(user_id: user_id)
      #  We need to make sure that a User exists in our database, before adding a message to our DB
      unless @user
        user = JSON.parse(Discordrb::API::User.resolve(ENV['TOKEN'], user_id))
        @user = Discord::User.new
        @user.assign_attributes(user)
        @user.status = 'active'
        @user.save
      end
    end
  end
end
