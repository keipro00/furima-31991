class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :user_items

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  with_options presence: true, format:{with: /\A[a-zA-Z0-9]+\z/, message: "パスワードは半角英数字混合の必要がある"}  do
    validates :password
  end


  with_options presence: true do
    validates :nickname
    validates :birth_day
  end
end
