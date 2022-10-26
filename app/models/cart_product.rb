class CartProduct < ApplicationRecord

  has_one_attached :product_image

  belongs_to :product
  belongs_to :customer

  validates :quantity, numericality: { only_integer: true }

  def subtotal
    product.tax_included_price * quantity
  end

end
