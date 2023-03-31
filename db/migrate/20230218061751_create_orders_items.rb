class CreateOrdersItems < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_items do |t|
      t.belongs_to :order
      t.belongs_to :item
      t.timestamps
    end
  end
end
