class ApiChannelController < ApplicationController
  before_filter :find_channel, only: [:show, :update]

  before_filer only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('channel') && @json['channel'].responds_to?(:[]) && @json['channel']['id'])
  end

  before_filter only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@channel, "Channel", "find_by_id(@json['channel']['id'])")
  end

  before_filter only: :create do |c|
    meth = c.method(:check_existence)
    meth.call(@channel, "Channel", "find_by_id(@json['project']['id'])")
  end

  def create
    if @channel.present?
      render nothing: true, status: :conflict
    else
      @channel = Channel.new
      update_values :@channel, @json['channel']
    end
  end

  private
  def find_channel
    @project = Channel.find_by_id(params[:id])
    render nothing: true, status: :not_found unless @channel.present?
  end
end
