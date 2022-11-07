# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  body          :text             not null
#  rating        :integer          not null
#  product_id    :bigint           not null
#  reviewer_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  reviewer_name :string           not null
#
class Review < ApplicationRecord
    validates :reviewer_name, :title, :body, :rating, presence: true

    belongs_to :product,
        foreign_key: :product_id,
        class_name: :Product

    belongs_to :reviewer,
        foreign_key: :reviewer_id,
        class_name: :User
end
