class CartProduct < ApplicationRecord

  has_one_attached :product_image

  belongs_to :product
  belongs_to :customer

  def subtotal
    product.tax_included_price * quantity
  end

end
