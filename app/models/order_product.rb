class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def tax_included_price
        (product.tax_excluded_price * 1.1).round
  end

  def subtotal
    product.tax_included_price * quantity
  end

	enum work_status: {"着手不可": 0, "制作待ち": 1, "製作中": 2, "制作完了": 3 }

end
