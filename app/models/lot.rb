class Lot < ApplicationRecord
  has_paper_trail

  default_scope { order(moment: :asc) }

  belongs_to :unit
  belongs_to :user

  has_many :components
  has_many :products, through: :components

  accepts_nested_attributes_for :components, allow_destroy: false

  validates_associated :components

  after_save :create_entry

  def order
    self.components&.first&.order
  end

  def create_entry
    if self.status == 'paid'
      e = Entry.new(unit: self.unit, kind: 'out', entry_description: EntryDescription.find_or_create_by(name: "Pedido #{order.id}"), moment: self.moment, user_id: self.user_id)
      e.components = self.components
      e.save
    end
  end
end
