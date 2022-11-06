# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  category     :string           not null
#  description  :text             not null
#  price        :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_type :string
#  amount       :integer          not null
#
class Product < ApplicationRecord
    validates :name, :category, :amount, :description, :price, presence: true

    has_many_attached :photos

    has_many :cart_items,
        foreign_key: :product_id,
        class_name: :CartItem,
        dependent: :destroy

    has_many :reviews,
        foreign_key: :product_id,
        class_name: :Review,
        dependent: :destroy
end
