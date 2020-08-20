class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.date :register
      t.monetize :shipping
      t.integer :term
      t.references :provider, foreign_key: true
      t.references :bidding, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
