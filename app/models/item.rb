class Item < ApplicationRecord
   belongs_to :genre, optional: true
   has_one_attached :image
   has_many :cart_items
   
   validates :name, presence: true
   validates :description, presence: true
   validates :genre_id, presence: true
   validates :price, presence: true
   
   def add_tax_price
        (self.price * 1.10).round
   end

   def with_tax_price
    (price * 1.1).floor
   end
   
end
