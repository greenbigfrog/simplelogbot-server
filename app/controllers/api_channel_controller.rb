class ApiChannelController < BaseApiController
  before_action :find_channel, only: [:show, :update]

  before_action only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('channel') && @json['channel'].respond_to?(:[]) && @json['channel']['id'])
  end

  before_action only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@channel, "Discord::Channel", "find_by_id(@json['channel']['channel_id'])")
  end

  before_action :set_channel, only: :create

  def set_channel
    @channel = Discord::Channel.find_by(channel_id: @json['channel']['channel_id'])
  end

  def create
    if @channel.present?
      render body: nil, status: :conflict
    else
      @channel = Discord::Channel.new
      update_values :@channel, @json['channel']
    end
  end

  private
  def find_channel
    @channel = Discord::Channel.find_by_id(params[:id])
    render body: nil, status: :not_found and return unless @channel.present?
  end
end
