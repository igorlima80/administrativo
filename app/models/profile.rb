class Profile < ApplicationRecord
  has_many :permissions, dependent: :destroy

  accepts_nested_attributes_for :permissions, allow_destroy: true
end
