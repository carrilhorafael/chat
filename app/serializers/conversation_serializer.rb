class ConversationSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :speaker2, class_name: "User"
  belongs_to :speaker1, class_name: "User"
end
