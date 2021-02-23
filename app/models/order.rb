class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_products, dependent: :destroy

  enum payment_method:[:"クレジットカード", :"銀行振込"]
  enum order_status:[:"入金待ち", :"入金確認", :"製作中", :"発送準備中", :"発送済み"], _prefix: true
end
