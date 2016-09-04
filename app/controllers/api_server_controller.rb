class ApiServerController < BaseApiController
  before_filter :find_server, only: [:show, :update]

  before_filter only: :create do |c|
    meth = c.method(:validate_json)
    meth.call(@json.has_key?('server') && @json['server'].respond_to?(:[]) && @json['server']['id'])
  end

  before_filter only: :update do |c|
    meth = c.method(:validate_json)
    meth.call(@server, "Discord::Server", "find_by id(@json['server']['id'])")
  end

  before_filter only: :create do |c|
    meth = c.method(:check_existence)
    meth.call(@server, "Discord::Server", "find_by server_id: @json['server']['id']")
  end

  def create
    if @server.present?
      render nothing: true, status: :conflict
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
    render nothing: true, status: :not_found unless @server.present?
  end
end
