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

	enum work_status: {start_not_possible:0, production_pending:1, in_production:2, production_complete:3 }

end
