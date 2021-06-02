class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @room = params[:room]
    stream_for @room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
