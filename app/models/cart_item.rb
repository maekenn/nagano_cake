class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item


	validates :customer_id, :item_id, :amount, presence: true
  validates :amount, numericality: { only_integer: true }

   ## 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end

end
