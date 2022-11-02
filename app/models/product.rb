# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  category     :string           not null
#  description  :text             not null
#  price        :float            not null
#  image_url    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_type :string
#
class Product < ApplicationRecord
    validates :name, :category, :description, :price, presence: true

    has_many :cart_items,
        foreign_key: :product_id,
        class_name: :CartItem,
        dependent: :destroy
end
