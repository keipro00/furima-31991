class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :comments
  has_one :user_item
  
  # Activehashによるアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  #選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_fee, numericality: { other_than: 1 } 
  validates :prefecture, numericality: { other_than: 0 } 
  validates :delivery_day, numericality: { other_than: 1 } 

 with_options presence: true do
 validates :name
 validates :comment
 validates :image
 validates :category_id
 validates :status_id
 validates :delivery_fee_id
 validates :prefecture_id
 validates :delivery_days_id
 end
 
 validates :price, presence: true

#  価格の条件設定はのちほど
#  with_options presence: true, format: { with: /\A[\d]+\z/, /\A[300. + 9999999]+\z/ , message: '販売価格は、半角数値のみ' } do
#  end

end
