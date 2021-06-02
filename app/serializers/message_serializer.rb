class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :conversation
end
