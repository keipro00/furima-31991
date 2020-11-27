class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :comments
  has_one :user_item
  has_one_attached :image

  # Activehashによるアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  # 選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :delivery_day_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name
    validates :comment
    validates :image
    validates :price
    #  validates :category_id
    #  validates :status_id
    #  validates :delivery_fee_id
    #  validates :prefecture_id
    #  validates :delivery_days_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: '販売価格は、半角数値のみ保存可能' } 
  validates :price, inclusion: { in: 300..9999999, message: "販売価格は、300円〜9,999,999円の間である" }
end

