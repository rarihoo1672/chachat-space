json.chat_message @message.chat_message
json.chat_image @message.chat_image_url
json.user_name @message.user.name
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")