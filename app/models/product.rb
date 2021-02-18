class Product < ApplicationRecord

  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre
  attachment :image

end
