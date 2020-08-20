class MenuItem < ApplicationRecord
  belongs_to :menu_item, optional: true
  has_many :menu_items, -> { order(position: :asc)}

  scope :published, -> { where(published: true, menu_item_id: nil).order(position: :asc) }
end
