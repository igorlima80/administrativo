class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :link
      t.string :icon
      t.boolean :published
      t.integer :position, index: true
      t.string :target
      t.string :active_test
      t.string :permission
      t.string :permission_check

      t.timestamps
    end
  end
end
