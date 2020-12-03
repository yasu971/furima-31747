class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,              foreign_key: true
      t.string :postal_code,            null: false
      t.integer :prefecture_id,         null: false
      t.string :municipality,           null: false
      t.string :house_number
      t.string :building_name,          null: false
      t.string :telephone_number,       null: false

      t.timestamps
    end
  end
end
