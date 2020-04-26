json.array! @messages do |message|
  json.chat_message message.chat_message
  json.chat_image message.chat_image.url
  json.created_at message.created_at.to_s(:datetime)
  json.user_name message.user.name
  json.id message.id
end