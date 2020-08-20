class Responsability < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  belongs_to :unit, optional: true

  validates :profile_id, uniqueness: { scope: [:user_id, :unit_id] }
end
