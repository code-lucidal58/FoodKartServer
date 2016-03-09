class Order < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  has_one :confirm
end
