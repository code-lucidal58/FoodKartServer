class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :users, index: true
      t.string :admin_name
      t.string :admin_address
      t.string :restaurant
      t.string :item
      t.string :quantity
      t.string :price
      t.string :order_date
      t.boolean :active, :default=>true
      t.string :min_cost
      t.string :tot_cost


      t.timestamps null: false
    end
    #add_foreign_key :orders, :users
  end
end
