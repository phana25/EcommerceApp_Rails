class CreateAdminOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :amount
      t.integer :phone_number
      t.boolean :payment
      t.integer :status

      t.timestamps
    end
  end
end
