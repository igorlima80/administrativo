class CreateBankAccountTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_account_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
