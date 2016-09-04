class StatusController < BaseApiController
  def show
    render  json: {status:"You have successfully connected to the API"}
  end
end
