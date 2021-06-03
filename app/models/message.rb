class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  after_create {ConversationChannel.broadcast_to("ChatRoom-#{conversation.id}", conversation.messages)}
end
