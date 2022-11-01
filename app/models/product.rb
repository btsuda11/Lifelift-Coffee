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
#  product_type :string           not null
#
class Product < ApplicationRecord
    validates :name, :category, :description, :price, presence: true
end
