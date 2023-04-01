class Like < ApplicationRecord
  belongs_to :customer
  belongs_to :item
   validates :customer_id, uniqueness: { scope: :item_id }  #追記
end
