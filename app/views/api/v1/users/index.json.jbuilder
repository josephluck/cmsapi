json.array! @users do |user|
  json.(user, :id, :email, :admin_user, :api_consumer, :unconfirmed_email, :confirmation_sent_at)
end