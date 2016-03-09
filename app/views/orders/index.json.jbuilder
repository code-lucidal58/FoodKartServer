json.array!(@orders) do |order|
  json.extract! order, :id, :users_id, :admin_name, :admin_address, :restaurant,
                :item, :quantity, :price, :order_date,  :min_cost, :tot_cost, :created_at, :updated_at, :active
end
