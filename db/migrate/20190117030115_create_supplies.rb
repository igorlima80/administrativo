class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.references :provider, foreign_key: true
      t.references :suppliable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
