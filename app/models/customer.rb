class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  enum is_deleted: {"1": true, "0": false}

    def active_for_authentication?
        super && (self.is_deleted === "0")
        # is_deleted: "0"の場合は有効会員(ログイン可能)
    end

end