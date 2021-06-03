class Conversation < ApplicationRecord
  belongs_to :speaker2, class_name: "User"
  belongs_to :speaker1, class_name: "User"
  has_many :messages
end
