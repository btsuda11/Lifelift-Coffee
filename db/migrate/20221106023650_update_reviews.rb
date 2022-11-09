class UpdateReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :product_id, :bigint, null: false
    change_column :reviews, :reviewer_id, :bigint, null: false
  end
end
