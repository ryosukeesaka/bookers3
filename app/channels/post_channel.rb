class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    ActionCable.server.broadcast 'post_channel', data
  end
end