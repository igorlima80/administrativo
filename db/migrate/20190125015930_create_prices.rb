class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.references :quotation, foreign_key: true
      t.references :product, foreign_key: true
      t.references :task, foreign_key: true
      t.monetize :value

      t.timestamps
    end
  end
end
