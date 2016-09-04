class BaseApiController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_filter :parse_request, :authenticate_user_from_token!

  private
  def authenticate_user_from_token!
    if !@json['api_token']
      render nothing: true, status: :unauthorized
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
      render nothing: true, status: :bad_request
    end
  end

  def update_values(ivar, attributes)
    instance_variable_get(ivar).assign_attributes(attributes)
    if instance_variable_get(ivar).save
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end

  def check_existence(ivar, object, finder)
    instance_variable_set(ivar, instance_eval(object+"."+finder))
  end
end
