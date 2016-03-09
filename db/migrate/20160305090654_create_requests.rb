class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :users, index: true
      t.belongs_to :orders, index: true
      t.string :restaurant
      t.string :item
      t.string :quantity
      t.string :price
      t.boolean :accept, :default=>false
      t.timestamps null: false
    end
  end
end
