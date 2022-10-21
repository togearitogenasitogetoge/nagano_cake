class Product < ApplicationRecord
  belongs_to :genre

  has_one_attached :product_image

  validates :product_name, presence: true

  enum sales_status: { 販売中: true, 販売停止中: false }

  def tax_included_price
        (self.tax_excluded_price * 1.1).round
  end
end
