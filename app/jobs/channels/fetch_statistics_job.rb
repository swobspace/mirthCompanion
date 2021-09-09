module Channels
  class FetchStatisticsJob < CronJob
    queue_as :default
    self.cron_expression = '*/3 * * * *'

    def perform(options = {})
      options.symbolize_keys!
      server = options.fetch(:server) { Server.all.to_a }

      if server.kind_of? Array
        server.each do |srv|
          # create one job for each server
          Channels::FetchStatisticsJob.perform_later(server: srv)
        end
      else
        Rails.logger.debug("DEBUG:: fetch statistics job from #{server.name}")
        result = Statistics::FetchAll.new(server: server, create_channel: true).call
        if result.success?
          Rails.logger.debug("DEBUG:: #{server.name}: fetching statistics successful")
        else
          msg = "WARN:: #{server.name}: fetch channel statistics failed\n"
          msg += result.error_messages.join("\n")
          Rails.logger.warn(msg)
        end
        Turbo::StreamsChannel.broadcast_replace_later_to(:home_index,
          target: :queued_messages,
          partial: 'home/index',
          locals: {queued_messages: ChannelStatistic.where('channel_statistics.queued > 0').order('queued desc').to_a }
        )
        Turbo::StreamsChannel.broadcast_replace_later_to(:home_index,
          target: :server_status,
          partial: 'home/servers',
          locals: { servers: Server.all.to_a }
        )
      end

    end
    def max_attempts
      0
    end
  end
end
