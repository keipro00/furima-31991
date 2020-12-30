class ItemForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block,  :building, :phone, :user_id, :item_id, :token, :price
  
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "郵便番号はハイフンが必要"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone, format: {with: /\A\d{,11}\z/ , message:"電話番号は11桁以下かつハイフン不要"}
    validates :token
    validates :user_id
    validates :item_id
  end 
  
  def save 
    user_item = UserItem.create(item_id: item_id, user_id: user_id)
     Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone, user_item_id: user_item.id)
  end
end