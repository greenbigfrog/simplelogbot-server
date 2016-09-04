class ApiUserController < BaseApiController
  before_action :find_user, only: [:show, :update]

  before_action only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('user') && @json['user'].respond_to?(:[]) && @json['user']['id'])
  end

  before_action only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@user, "Discord::User", "find_by_id(@json['user']['id'])")
  end

  before_action :set_user, only: :create

  def set_user
    @server = Discord::User.find_by(server_id: @json['user']['id'])
  end

  def create
    if @user.present?
      render body: nil, status: :conflict
    else
      @user = Discord::User.new
      update_values :@user, @json['user']
    end
  end

  private
  def find_user
    @user = Discord::User.find_by_id(params[:id])
    render body: nil, status: :not_found and return unless @user.present?
  end
end
