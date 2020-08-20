class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :moment
      t.references :provider, foreign_key: true
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
