json.array! @users do |user|
  json.(user, :id, :email, :admin_user, :api_consumer)
end