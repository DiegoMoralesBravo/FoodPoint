class AddStatusItemToOrdersItems < ActiveRecord::Migration[7.0]
  def change
    add_column :orders_items, :status_item, :boolean, :default => false
  end
end
