class AddProductIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :product_id, :integer
  end
end
