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

  #enum payment_method: { クレジットカード: true, 銀行振込: false }
  #enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]

end
