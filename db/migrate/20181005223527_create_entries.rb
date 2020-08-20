class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :unit, foreign_key: true
      t.monetize :value
      t.string :description
      t.string :kind
      t.datetime :moment

      t.timestamps
    end
  end
end
