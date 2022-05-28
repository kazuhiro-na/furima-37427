class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :name_sei, format: { message: 'is invalid. Input full-width characters' }
    validates :name_mei, format: { message: 'is invalid. Input full-width characters' }
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :name_sei_kana, format: { message: 'is invalid. Input full-width katakana characters' }
    validates :name_mei_kana, format: { message: 'is invalid. Input full-width katakana characters' }
  end
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
end
