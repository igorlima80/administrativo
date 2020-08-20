class Unit < ApplicationRecord
  has_paper_trail

  resourcify
  acts_as_tree order: "name"
  has_ancestry

  has_many :entries
  has_many :lots
  has_many :orders
  has_many :contracts

  has_many :components, through: :lots
  has_many :products, -> { distinct.reorder('products.name asc') }, through: :components

  validates :name, :parent_id, presence: true

  def fullpath
    self.path.pluck(:name).join(' > ')
  end

  def parent_name
    parent&.name
  end
end
