class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_products, dependent: :destroy
  
  enum address:[:"ご自身の住所", :"登録済住所から選択", :"新しいお届け先"]
  enum payment_method:[:"クレジットカード", :"銀行振込"]

end
