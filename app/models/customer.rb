class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :deliveries

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.family_name + " " + self.first_name
  end

  def kana_full_name
    self.kana_family_name + " " + self.kana_first_name
  end

end
