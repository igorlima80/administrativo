class Bidding < ApplicationRecord
  has_paper_trail

  belongs_to :user

  has_many :bidding_items, dependent: :destroy

  has_many :products, through: :bidding_items
  has_many :tasks, through: :bidding_items

  accepts_nested_attributes_for :bidding_items, allow_destroy: true

  has_many :quotations

  def products_bidding_items
    self.bidding_items.where.not(product_id: nil)
  end

  def tasks_bidding_items
    self.bidding_items.where.not(task_id: nil)
  end

  def list_products
    self.products.pluck(:name).join(", ")
  end

  def list_tasks
    self.tasks.pluck(:name).join(", ")
  end

  def user_name
    user.the_name
  end
end
