class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :name_sender, :id_sender
  belongs_to :conversation
  def name_sender
    self.object.sender.name
  end
  def id_sender
    self.object.sender.id
  end
end
