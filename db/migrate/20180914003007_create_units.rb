class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :name
      t.string :description
      t.references :parent, index: true, foreign_key: { to_table: :units }

      t.timestamps
    end
  end
end
