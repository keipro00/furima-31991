class Item < ApplicationRecord

 belongs_to :user
 has_many :comments
 has_one :user_item

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
