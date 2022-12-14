class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_products
  has_many :order_products, dependent: :destroy


  has_one_attached :product_image

  validates :product_image, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :genre_id, presence: true
  validates :tax_excluded_price, presence: true



  def tax_included_price
        (self.tax_excluded_price * 1.1).round
  end

  def get_image
    unless product_image.attached?
     file_path = Rails.root.join('app/assets/images/①ロゴ（英字・ケーキのイラスト）.png')
    #アタッチされていなっかった場合のイメージは仮
      product_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    product_image
  end

end
