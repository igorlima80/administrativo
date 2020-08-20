class Product < ApplicationRecord
  has_paper_trail

  belongs_to :category

  has_many :components
  has_many :units, -> { distinct.reorder('units.name asc') }, through: :components

  has_many :lots, through: :components
  has_many :entries, through: :components

  has_many :supplies, as: :suppliable
  has_many :providers, through: :supplies

  has_many :prices
  has_many :quotations, through: :prices

  def stock(params = {})
    if params[:unit_id]
      pin = self.components.left_joins(:lot).where(lots: { unit_id: params[:unit_id] }).where(kind: 'in')
    else
      pin = self.components.where(kind: 'in')
    end
    pout = self.components.where(kind: 'out', component_id: pin.pluck(:id)).where.not(id: params[:component_id])
    pin.sum(:quantity) - pout.sum(:quantity)
  end
end
