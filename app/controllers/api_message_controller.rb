class ApiMessageController < ApplicationController
  before_filter :find_message, only: [:show, :update]

  before_filer only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('message') && @json['message'].responds_to?(:[]) && @json['message']['id'])
  end

  before_filter only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@message, "Message", "find_by_id(@json['message']['id'])")
  end

  before_filter only: :create do |c|
    meth = c.method(:check_existence)
    meth.call(@message, "Message", "find_by_id(@json['project']['id'])")
  end

  def create
    if @message.present?
      render nothing: true, status: :conflict
    else
      @message = Message.new
      update_values :@message, @json['message']
    end
  end

  private
  def find_message
    @project = Message.find_by_id(params[:id])
    render nothing: true, status: :not_found unless @message.present?
  end
end
