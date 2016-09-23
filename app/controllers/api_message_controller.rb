class ApiMessageController < BaseApiController
  before_action :find_message, only: [:show, :update]

  before_action only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('message') && @json['message'].respond_to?(:[]) && @json['message']['message_id'])
  end

  before_action only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@message, "Message", "find_by_id(@json['message']['message_id'])")
  end

  before_action :set_message, only: :create

  def set_message
    @message = Discord::Message.find_by(message_id: @json['message']['message_id'])
  end

  before_action :ensure, only: :create

  def ensure
    Discord::User.ensure_user(@json['message']['user_id'])
    Discord::Membership.ensure_membership(@json['message']['user_id'], @json['message']['server_id'])
  end

  def create
    if @message.present?
      render body: nil, status: :conflict
    else
      @message = Discord::Message.new
      update_values :@message, @json['message']
    end
  end

  private
  def find_message
    @message = Discord::Message.find_by_id(params[:id])
    render body: nil, status: :not_found and return unless @message.present?
  end
end
