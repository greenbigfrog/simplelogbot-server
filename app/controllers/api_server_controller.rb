class ApiServerController < BaseApiController
  before_action :find_server, only: [:show, :update]

  before_action only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('server') && @json['server'].respond_to?(:[]) && @json['server']['server_id'])
  end

  before_action only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@server, "Discord::Server", "find_by id(@json['server']['id'])")
  end

  before_action :set_server, only: :create

  def set_server
    @server = Discord::Server.find_by(server_id: @json['server']['id'])
  end

  def create
    if @server.present?
      render body: nil, status: :conflict
    else
      @server = Discord::Server.new
      update_values :@server, @json['server']
    end
  end

  def update
    update_values :@server, @json['server']
  end


  private
  def find_server
    @server = Discord::Server.find_by_id(params[:id])
    render body: nil, status: :not_found and return unless @server.present?
  end
end
