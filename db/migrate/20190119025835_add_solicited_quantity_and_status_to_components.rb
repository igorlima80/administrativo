class AddSolicitedQuantityAndStatusToComponents < ActiveRecord::Migration[5.2]
  def change
    add_column :components, :solicited_quantity, :integer
    add_reference :components, :order, foreign_key: true
  end
end
