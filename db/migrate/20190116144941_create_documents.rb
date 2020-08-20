class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :number
      t.date :emission
      t.string :department
      t.references :state, foreign_key: true
      t.references :document_type, foreign_key: true
      t.references :documentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
