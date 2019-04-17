class CreateHeadquarters < ActiveRecord::Migration[5.1]
  def change
    create_table :headquarters do |t|
      t.references :user, foreign_key: true
      t.integer :city_vp
      t.string :name
      t.string :address
      t.string :photo_url

      t.timestamps
    end
  end
end
