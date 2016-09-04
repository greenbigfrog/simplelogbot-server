class ApiMembershipController < ApplicationController
  before_filter :find_membership, only: [:show, :update]

  before_filer only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('membership') && @json['membership'].responds_to?(:[]) && @json['membership']['id'])
  end

  before_filter only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@membership, "Membership", "find_by_id(@json['membership']['id'])")
  end

  before_filter only: :create do |c|
    meth = c.method(:check_existence)
    meth.call(@membership, "Membership", "find_by_id(@json['project']['id'])")
  end

  def create
    if @membership.present?
      render nothing: true, status: :conflict
    else
      @membership = Discord::Membership.new
      update_values :@membership, @json['membership']
    end
  end

  private
  def find_membership
    @project = Discord::Membership.find_by_id(params[:id])
    render nothing: true, status: :not_found unless @membership.present?
  end
end
