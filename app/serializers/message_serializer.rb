class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :sender_id
  def id_sender
    self.object.sender.id
  end
end
