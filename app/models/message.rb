class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :chat_message, presence: true, unless: :chat_image?

  mount_uploader :chat_image, ImageUploader
end
