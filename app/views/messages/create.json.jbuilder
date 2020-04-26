json.chat_message @message.chat_message
json.chat_image @message.chat_image_url
json.user_name @message.user.name
json.created_at @message.created_at.to_s(:datetime)
json.id @message.id