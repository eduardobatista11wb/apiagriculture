class Farms < ActiveRecord::Migration[8.0]
  def change
    create_table :farms do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
