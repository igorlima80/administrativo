class AddStatusToLots < ActiveRecord::Migration[5.2]
  def change
    add_column :lots, :status, :string
  end
end
