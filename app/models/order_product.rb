class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: { only_integer: true }

  def tax_included_price
        (product.tax_excluded_price * 1.1).round
  end

  def subtotal
    product.tax_included_price * quantity
  end

	enum work_status: {"着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }

end
