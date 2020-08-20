class AddCategoryToComponents < ActiveRecord::Migration[5.2]
  def change
    add_reference :components, :category, foreign_key: true
    add_reference :components, :component, foreign_key: true
    add_column :components, :kind, :string
  end
end
