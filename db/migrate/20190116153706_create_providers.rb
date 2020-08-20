class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nickname
      t.string :cpf
      t.string :cnpj
      t.string :email
      t.date :register
      t.string :principal_seller

      t.timestamps
    end
  end
end
