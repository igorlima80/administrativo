class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :agency
      t.string :number
      t.string :operation
      t.references :bank, foreign_key: true
      t.references :bank_account_type, foreign_key: true
      t.references :accountable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
