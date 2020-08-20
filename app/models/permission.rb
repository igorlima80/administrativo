class Permission < ApplicationRecord
  default_scope { order(position: :asc) }

  belongs_to :profile, optional: true
end
