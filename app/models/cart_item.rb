# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          not null
#  shopper_id :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
    validates :quantity, presence: true

    belongs_to :shopper,
        foreign_key: :shopper_id,
        class_name: :User

    belongs_to :product,
        foreign_key: :product_id,
        class_name: :Product
end
