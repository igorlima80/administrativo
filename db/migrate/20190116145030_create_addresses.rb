class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :zipcode
      t.string :street
      t.string :number
      t.string :complement
      t.string :district
      t.references :city, foreign_key: true
      t.string :gia
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
