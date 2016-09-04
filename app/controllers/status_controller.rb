class StatusController < BaseApiController
  def update
    render  json: {status:"You have successfully connected to the API"}
  end
end
