class CreateOrdersItems < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_items do |t|
      t.belongs_to :orders
      t.belongs_to :items
      t.timestamps
    end
  end
end
