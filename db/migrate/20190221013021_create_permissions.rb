class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :object
      t.string :position
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
