class ConversationSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :user
end
