module Discord
  class Discord::Membership < ApplicationRecord
    belongs_to :server, inverse_of: :memberships
    belongs_to :user, inverse_of: :memberships

    def self.ensure_membership(user_id, server_id)
      raise 'pass in a user ID' unless user_id
      raise 'pass in a server ID' unless server_id
      # After checking if a user exists, we still need to make sure, that a Membership exists for the user on the Server
      # the message came from exists
      @membership = Discord::Membership.find_by(user_id: user_id, server_id: server_id)
      unless @membership
        membership = JSON.parse(Discordrb::API::Server.resolve_member(ENV['TOKEN'], server_id, user_id))
        @membership = Discord::Membership.new
        display_name = membership["nick"] unless membership["nick"].nil?
        display_name = membership["user"]["username"] if membership["nick"].nil?
        @membership.display_name = display_name
        @membership.server_id = server_id
        @membership.user_id = user_id
        @membership.status = 'active'
        @membership.save
      end
    end
  end
end
