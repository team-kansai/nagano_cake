class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  enum is_deleted: {"退会": true, "有効": false}

    def active_for_authentication?
        super && (self.is_deleted === "有効")
    end
    
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def full_name
    self.last_name + self.first_name
  end

end