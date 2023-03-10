class Item < ApplicationRecord
   belongs_to :genre, optional: true
   has_one_attached :image
end
