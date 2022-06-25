class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :tell, :postal_code, :prefecture_id, :municipalities, :address, :building, :token

  with_options presence: true do
    validates :tell, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :municipalities
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id, tell: tell)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                           address: address, building: building, purchase_record_id: purchase_record.id)
  end
end
