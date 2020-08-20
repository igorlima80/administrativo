class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.integer :quantity
      t.monetize :unit_value
      t.references :product, foreign_key: true
      t.references :entry, foreign_key: true
      t.references :lot, foreign_key: true

      t.timestamps
    end
  end
end
