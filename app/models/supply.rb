class Supply < ApplicationRecord
  belongs_to :provider
  belongs_to :suppliable, polymorphic: true
end
