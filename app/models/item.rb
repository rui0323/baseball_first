class Item < ApplicationRecord
   belongs_to :genre, optional: true
   has_many_attached :image
   has_many :cart_items
   has_many :order_details
   belongs_to :customer
   has_many :likes, dependent: :destroy

   validates :name, presence: true
   validates :description, presence: true
   validates :genre_id, presence: true
   validates :price, presence: true
   validates :image, presence: true
   def add_tax_price
        (self.price * 1.10).round
   end

   def with_tax_price
    (price * 1.1).floor
   end

   def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @item = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @item = Item.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%")
    else
      @item = Item.all
    end
   end

   def liked_by(customer)
    Like.find_by(customer_id: customer.id, item_id: id)
   end

end
