class HomeController < ApplicationController
  def index
    @queued_messages = ChannelStatistic
                       .where('meta_data_id > 0')
                       .where('channel_statistics.queued > 0')
                       .order('queued desc')
    @servers = Server.all
  end
end
