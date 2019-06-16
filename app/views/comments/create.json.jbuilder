json.text  @comment.text
json.user_id  @comment.user.id
json.user_name  @comment.user.name
json.created_at @comment.created_at.strftime("%Y/%m/%d %H:%M")
json.odai_id @comment.copy.odai.id
json.copy_id @comment.copy.id
json.id @comment.id

