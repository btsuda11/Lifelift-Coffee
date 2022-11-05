class AddNamePriceToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :name, :string, null: false
    add_column :cart_items, :product_type, :string, null: false
  end
end
