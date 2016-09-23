module Discord
  class Discord::Membership < ApplicationRecord
    belongs_to :server, inverse_of: :memberships
    belongs_to :user, inverse_of: :memberships

    def self.ensure_membership(user_id, server_id)
      # After checking if a user exists, we still need to make sure, that a Membership exists for the user on the Server
      # the message came from exists
      @membership = Discord::Membership.find_by(user_id: user_id, server_id: server_id)
      unless @membership
        membership = Discordrb::API::Server.resolve_member(ENV['TOKEN'], server_id, user_id)
        @membership = Discord::Membership.new
        update_values :@membership, membership
      end
    end
  end
end
