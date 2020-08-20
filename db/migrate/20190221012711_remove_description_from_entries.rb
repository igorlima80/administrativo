class RemoveDescriptionFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :description, :string
  end
end
