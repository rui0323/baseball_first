class Order < ApplicationRecord
     belongs_to :customer
      has_many :order_details

    validates :postcode, presence: true
    validates :address, presence: true
    validates :name, presence: true

     enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }

    def subtotal
    item.with_tax_price * amount
    end
end
