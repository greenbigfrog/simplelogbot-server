class BaseApiController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :parse_request
  before_action :authenticate_user_from_token!

  private
  def authenticate_user_from_token!
    if !@json['api_token']
      render body: nil, status: :unauthorized
    else
      @user = nil
      User.find_each do |u|
        if Devise.secure_compare(u.authentication_token, @json['api_token'])
          @user = u
        end
      end
    end
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

  def validate_json(condition)
    unless condition
      render body: nil, status: :bad_request
    end
  end

  def update_values(ivar, attributes)
    instance_variable_get(ivar).assign_attributes(attributes)
    if instance_variable_get(ivar).save
      render body: nil, status: :ok
    else
      render body: nil, status: :bad_request
    end
  end
end
