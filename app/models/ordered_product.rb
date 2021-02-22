class OrderedProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product
  
  enum production_status:[:"製作不可", :"製作待ち", :"製作中", :"製作完了"], _prefix: true

end
