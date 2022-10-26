class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products , dependent: :destroy
  has_many :orders , dependent: :destroy
  has_many :deliveries , dependent: :destroy
  validates :family_name , presence: true, length: { maximum:30 }
  validates :first_name , presence: true, length: { maximum:30 }
  validates :kana_family_name , presence: true, length: { maximum:30 }
  validates :kana_first_name , presence: true, length: { maximum:30 }
  validates :postal_code , presence: true , length: { is:7} , numericality: { only_interger:true }
  validates :address , presence: true ,length: { maximum:161 }
  validates :phone_number , presence: true , numericality: { only_integer:true } ,length: { maximum:21 }
  validates :email , presence: true, length: { maximum:254 }

  def full_name
    self.family_name + " " + self.first_name
  end

  def kana_full_name
    self.kana_family_name + " " + self.kana_first_name
  end

end
