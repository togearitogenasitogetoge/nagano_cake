class Order < ApplicationRecord



  validates :payment_method, presence:true
  validates :order_status, presence:true
  validates :shipping_fee, presence:true
  validates :request_amount, presence:true
  validates :name, presence:true
  validates :postal_code, presence:true
  validates :address, presence:true

end
