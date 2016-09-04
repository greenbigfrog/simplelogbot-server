class ApiMembershipController < BaseApiController
  before_action :find_membership, only: [:show, :update]

  before_action only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('membership') && @json['membership'].respond_to?(:[]) && @json['membership']['id'])
  end

  before_action only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@membership, "Discord::Membership", "find_by_id(@json['membership']['id'])")
  end

  before_action :set_membership, only: :create

  def set_membership
    @membership = Discord::Membership.find_by(server_id: @json['membership']['server_id'], user_id: @json['membership']['user_id'])
  end

  def create
    if @membership.present?
      render body: nil, status: :conflict
    else
      @membership = Discord::Membership.new
      update_values :@membership, @json['membership']
    end
  end

  private
  def find_membership
    @membership = Discord::Membership.find_by_id(params[:id])
    render body: nil, status: :not_found and return unless @membership.present?
  end
end
