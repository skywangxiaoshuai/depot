class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through:  :line_items
  before_destroy :ensure_not_referensed_by_any_line_item

  validates  :title,  :description,  :image_url, presence:  true
  validates  :price,  numericality:  { greater_than_or_equal_to:  0.01, message:  '价格要大于等于0.01' }
  validates :title, uniqueness: true, length:  { minimum:  10 }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private

  def ensure_not_referensed_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line  Items  present')
      return false
    end
  end
end
