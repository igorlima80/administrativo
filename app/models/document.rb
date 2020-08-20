class Document < ApplicationRecord
  has_paper_trail
  
  belongs_to :state
  belongs_to :document_type
  belongs_to :documentable, polymorphic: true
end
