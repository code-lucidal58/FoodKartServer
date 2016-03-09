class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token, :default=> nil
      t.string :name
      t.string :email
      t.string :phone
      t.string :gender
      t.string :dob, :default=> nil
      t.string :address, :default => nil
      t.string :gcm_reg_no, :default=>nil
      t.string :photo_url, :default=> nil
      t.string :salt, :default=>nil
      t.string :password
      t.boolean :active, :default=>true
      t.timestamps null: false
    end
  end
end
