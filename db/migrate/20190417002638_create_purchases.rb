class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :phone, foreign_key: true
      t.decimal :price, presicion : 15, scale: 10
      t.date :date
      t.datetime :warranty

      t.timestamps
    end
  end
end
