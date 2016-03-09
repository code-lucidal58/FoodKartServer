# json.array!(@orders) do |order|
#   json.extract! order, :id, :users_id, :restaurant, :item, :quantity, :price, :created_at, :updated_at
#   #json.url order_url(order, format: :json)
# end

json.array!(@orders) do |o|
  json.extract! o, :id, :users_id, :restaurant, :item, :quantity, :price, :created_at, :updated_at
end
