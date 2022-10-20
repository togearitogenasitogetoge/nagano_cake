class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cart_products , dependent: :destroy
  has_many :orders , dependent: :destroy
  has_many :deliveries , dependent: :destroy

  def full_name
    self.family_name + " " + self.first_name
  end

  def kana_full_name
    self.kana_family_name + " " + self.kana_first_name
  end


end
