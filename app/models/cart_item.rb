class CartItem < ApplicationRecord
   belongs_to :item
   belongs_to :customer
   validates :amount, presence: true
   has_many_attached :image

  def subtotal
    item.with_tax_price * amount
  end
end
