class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,              foreign_key: true
      t.string     :postal_code,        null: false
      t.integer    :shipment_source_id, null: false
      t.string     :city,               null: false
      t.string     :house_number,       null: false
      t.string     :building,           null: true
      t.string     :tel_number,         null: false
      t.timestamps
    end
  end
end
