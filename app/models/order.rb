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


  enum payment_method: {credit_card:0,transfer:1}
  enum order_status:{"入金待ち":0, "入金確認": 1, "製作中":2, "発送準備中":3, "発送済み":4}

end