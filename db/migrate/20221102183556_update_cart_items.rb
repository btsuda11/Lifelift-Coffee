class UpdateCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :size, :string, null: false
    add_column :cart_items, :price, :float, null: false
  end
end
