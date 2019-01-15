json.array! @new_messages.each do |message|
  json.id message.id
  json.text message.text
  json.image message.image.url
  json.date message.created_at.strftime("%Y-%m-%d %H:%M")
  json.user_name message.user.name
  json.user_hello message.user.hello
end
