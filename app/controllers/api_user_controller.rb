class ApiUserController < BaseApiController
  before_filter :find_user, only: [:show, :update]

  before_filer only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('user') && @json['user'].respond_to?(:[]) && @json['user']['id'])
  end

  before_filter only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@user, "User", "find_by_id(@json['user']['id'])")
  end

  before_filter only: :create do |c|
    meth = c.method(:check_existence)
    meth.call(@user, "User", "find_by_id(@json['user']['id'])")
  end

  def create
    if @user.present?
      render nothing: true, status: :conflict
    else
      @user = Discord::User.new
      update_values :@user, @json['user']
    end
  end

  private
  def find_user
    @user = Discord::User.find_by_id(params[:id])
    render nothing: true, status: :not_found unless @user.present?
  end
end
