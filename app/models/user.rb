class User < ActiveRecord::Base
  has_many :orders
  has_many :requests
  has_one :confirm
  validates_uniqueness_of :email, conditions:-> {where :active => true}
  validates_uniqueness_of :phone, conditions:-> {where :active => true}
end
