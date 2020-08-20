class Quotation < ApplicationRecord
  has_paper_trail

  belongs_to :provider
  belongs_to :user
  belongs_to :bidding, optional: true

  has_many :prices, dependent: :destroy

  has_many :products, through: :prices
  has_many :tasks, through: :prices

  accepts_nested_attributes_for :prices, allow_destroy: true

  monetize :shipping_cents
  monetize :prices_value_cents

  def products_prices
    self.prices.where.not(product_id: nil)
  end

  def tasks_prices
    self.prices.where.not(task_id: nil)
  end

  def list_products
    self.products.pluck(:name).join(", ")
  end

  def list_tasks
    self.tasks.pluck(:name).join(", ")
  end

  def user_name
    user&.the_name
  end

  def prices_value_cents
    self.prices.sum(:value_cents)
  end
end
