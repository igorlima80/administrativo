class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.references :phone_type, foreign_key: true
      t.references :phonable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
