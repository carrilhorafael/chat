class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :id_sender
  def id_sender
    self.object.sender.id
  end
end
