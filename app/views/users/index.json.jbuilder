json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone,:email,:gender,:address,:created_at, :updated_at, :active, :access_token, :password
  #json.url user_url(user, format: :json)
end
