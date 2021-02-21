class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_products, dependent: :destroy

  enum payment_method:[:"クレジットカード", :"銀行振込"]


end
