class CreateBiddingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bidding_items do |t|
      t.references :bidding, foreign_key: true
      t.references :product, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
