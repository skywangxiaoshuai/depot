class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to  :product
  belongs_to  :cart

  def total_price
    product.try(:price).to_i * quantity
  end
end
