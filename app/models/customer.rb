class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   has_many :cart_items
  has_many :shopping_addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
