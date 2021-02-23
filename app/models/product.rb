class Product < ApplicationRecord

  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre
  attachment :image


  enum is_active:{"販売中": true, "販売停止中": false }

end
