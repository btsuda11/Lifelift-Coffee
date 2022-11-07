class ChangeNameColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :name
    add_column :reviews, :reviewer_name, :string, null: false
  end
end
