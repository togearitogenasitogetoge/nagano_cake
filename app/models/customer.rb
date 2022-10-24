class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products , dependent: :destroy
  has_many :orders , dependent: :destroy
  has_many :deliveries , dependent: :destroy
  validates :family_name , presence: true
  validates :first_name , presence: true
  validates :kana_family_name , presence: true
  validates :kana_first_name , presence: true
  validates :postal_code , presence: true
  validates :address , presence: true
  validates :phone_number , presence: true
  validates :email , presence: true

  def full_name
    self.family_name + " " + self.first_name
  end

  def kana_full_name
    self.kana_family_name + " " + self.kana_first_name
  end

end
