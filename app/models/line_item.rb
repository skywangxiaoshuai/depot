class LineItem < ApplicationRecord
    belongs_to  :product
    belongs_to  :cart

    def  total_price
        product.try(:price).to_i  *  quantity
    end
end
