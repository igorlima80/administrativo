class Task < ApplicationRecord
  has_paper_trail
  
  has_many :supplies, as: :suppliable
  has_many :providers, through: :supplies

  has_many :prices
  has_many :quotations, through: :prices
end
