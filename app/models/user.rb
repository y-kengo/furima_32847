class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  password_regex = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: password_regex
  name_regex = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  kana_regex = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :family_name, format: {with: name_regex }
    validates :family_name_kana, format: {with: kana_regex }
    validates :first_name, format: {with: name_regex } 
    validates :first_name_kana, format: {with: kana_regex }
    validates :birth_day
  end

  has_many :items

end
