json.array!(@requests) do |request|
  json.extract! request, :id, :users_id, :orders_id, :item, :quantity, :price, :created_at, :updated_at, :accept
end
