class Component < ApplicationRecord
  has_paper_trail

  belongs_to :order, optional: true
  belongs_to :entry, optional: true
  belongs_to :lot, optional: true

  belongs_to :category
  belongs_to :product
  belongs_to :component, optional: true
  has_many :components

  has_one :unit, through: :lot

  scope :unit_tree, ->(param) do
    uid, boolean = param.split(",")
    if boolean == "true"
      joins(:unit).where(units: { id: Unit.find(uid).subtree_ids })
    else
      joins(:unit).where(units: { id: uid })
    end
  end

  def self.ransackable_scopes(auth_object = nil)
    [:unit_tree]
  end

  monetize :unit_value_cents

  validates :unit_value_cents, presence: { if: Proc.new{ |c| c.kind == 'in' } }
  validates :quantity, presence: { if: Proc.new{ |c| c.solicited_quantity.nil? } }
  validates :solicited_quantity, presence: { if: Proc.new{ |c| c.quantity.nil? } }
  validates :component, presence: { if: Proc.new{ |c| c.kind == 'out' } }

  validate :quantity_in_stock, on: :create

  def quantity_in_stock
    if self.kind == 'out'
      errors.add(:quantity, "insuficiente") if self.quantity > self.component.available
    end
  end

  def used
    self.components.sum(:quantity)
  end

  def available
    self.quantity - self.used
  end

  def name
    "Lote #{id} | Estoque: #{self.available}"
  end

  def total_value
    self.solicited_quantity * self.unit_value
  end
end
