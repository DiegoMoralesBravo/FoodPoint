class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :description
      t.string :image
      t.timestamps
    end
  end
end
