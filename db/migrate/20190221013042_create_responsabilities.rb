class CreateResponsabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :responsabilities do |t|
      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
