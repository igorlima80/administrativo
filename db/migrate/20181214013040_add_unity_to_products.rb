class AddUnityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :unity, :string
  end
end
