class Price < ApplicationRecord
  has_paper_trail
  
  belongs_to :quotation, optional: true
  belongs_to :product, optional: true
  belongs_to :task, optional: true

  monetize :value_cents
end
