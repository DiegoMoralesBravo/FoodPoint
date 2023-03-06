class AddQuantityToOrdersItems < ActiveRecord::Migration[7.0]
  def change
    add_column :orders_items, :quantity, :integer, :default => 1
  end
end
