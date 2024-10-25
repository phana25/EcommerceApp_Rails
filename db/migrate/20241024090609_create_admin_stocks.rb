class CreateAdminStocks < ActiveRecord::Migration[8.0]
  def change
    create_table :stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
