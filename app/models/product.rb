class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_products


  has_one_attached :product_image

  validates :product_name, presence: true


  def tax_included_price
        (self.tax_excluded_price * 1.1).round
  end

end
