class CreateAdminProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :stock
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
