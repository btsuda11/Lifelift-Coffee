class UpdateProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :type
    add_column :products, :product_type, :string, null: false
  end
end
