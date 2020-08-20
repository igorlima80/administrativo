class CreateLots < ActiveRecord::Migration[5.2]
  def change
    create_table :lots do |t|
      t.string :kind
      t.datetime :moment
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
