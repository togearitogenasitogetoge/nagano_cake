class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy

  validates :payment_method, presence:true
  validates :order_status, presence:true
  validates :shipping_fee, presence:true
  validates :request_amount, presence:true
  validates :name, presence:true
  validates :postal_code, presence:true
  validates :address, presence:true

  enum payment_method: {credit_card:1,bank_transfer:1}

  enum order_status:{payment_waiting:0,payment_confirmation:1,in_production:2,preparing_delivery:3,delivered:4}


end
