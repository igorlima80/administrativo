class Address < ApplicationRecord
  has_paper_trail
  
  belongs_to :city
  belongs_to :addressable, polymorphic: true
end
