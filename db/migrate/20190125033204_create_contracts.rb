class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.datetime :moment
      t.references :provider, foreign_key: true
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true
      t.references :task, foreign_key: true
      t.references :entry, foreign_key: true
      t.monetize :value

      t.timestamps
    end
  end
end
