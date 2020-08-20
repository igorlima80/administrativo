class AddEntryDescriptionToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :entry_description, foreign_key: true
  end
end
