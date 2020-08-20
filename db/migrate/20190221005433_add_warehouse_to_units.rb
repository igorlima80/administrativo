class AddWarehouseToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :warehouse, :boolean, default: false
  end
end
