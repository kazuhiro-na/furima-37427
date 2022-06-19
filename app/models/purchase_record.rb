class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase_record

  validates :tell, presence: true, format: {with: /\A\d{10,11}\z/}
end
