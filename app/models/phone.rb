class Phone < ApplicationRecord
  has_paper_trail
  
  belongs_to :phone_type
  belongs_to :phonable, polymorphic: true
end
