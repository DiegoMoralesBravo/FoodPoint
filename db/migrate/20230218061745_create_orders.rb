class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :tables
      t.string :status
      t.integer :total
      t.string :note
      t.timestamps
    end
  end
end
