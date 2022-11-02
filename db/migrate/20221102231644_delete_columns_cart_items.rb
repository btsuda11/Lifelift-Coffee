class DeleteColumnsCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :size
    remove_column :cart_items, :price
    remove_column :cart_items, :name
    remove_column :cart_items, :product_type
  end
end
