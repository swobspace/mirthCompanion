class Channels::AlertsController < AlertsController
  before_action :set_channel

private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def location
    channel_path(@channel)
  end
end

