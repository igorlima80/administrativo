class Order < ApplicationRecord
  has_paper_trail

  default_scope { order(moment: :asc) }

  belongs_to :unit
  belongs_to :user

  belongs_to :provider
  has_many :components, dependent: :destroy
  has_many :lots, through: :components

  accepts_nested_attributes_for :components, allow_destroy: true

  validates_associated :components

  validates :moment, presence: true

  after_create :create_lot

  def lot
    self.lots&.first
  end

  def create_lot
    l = Lot.new(unit: self.unit, kind: 'in', status: 'new', moment: self.moment, user_id: self.user_id)
    l.components = self.components
    l.save
  end

  def total_value
    self.components.map(&:total_value).sum
  end

  def inconsistent?
    self.components.where('quantity != solicited_quantity').any?
  end
end
