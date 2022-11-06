class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.references :product, foreign_key: true
      t.references :reviewer, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
