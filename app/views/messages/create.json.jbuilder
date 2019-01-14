json.id  @message.id
json.user_name @message.user.name
json.user_hello @message.user.hello
json.group_id @group.id
json.text @message.text
json.image @message.image.url
json.date  @message.created_at.strftime("%Y-%m-%d %H:%M")
