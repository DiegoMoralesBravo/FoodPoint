class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.integer :id_item
      t.integer :id_ingredient
      t.integer :quantity

      t.timestamps
    end
  end
end
