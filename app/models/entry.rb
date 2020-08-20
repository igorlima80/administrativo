class Entry < ApplicationRecord
  has_paper_trail

  belongs_to :unit
  belongs_to :user
  belongs_to :entry_description

  has_many :components, dependent: :destroy

  monetize :value_cents

  validates :value_cents, :moment, presence: true

  validates_associated :components

  after_validation :compute_value

  scope :unit_tree, ->(param) do
    uid, boolean = param.split(",")
    if boolean == "true"
      joins(:unit).where(units: { id: Unit.find(uid).subtree_ids })
    else
      joins(:unit).where(units: { id: uid })
    end
  end

  def description
    self.entry_description&.name
  end

  def self.ransackable_scopes(auth_object = nil)
    [:unit_tree]
  end

  def compute_value
    unless self.components.empty?
      self.value_cents = 0
      self.components.each do |cp|
        self.value_cents = self.value_cents + (cp.unit_value_cents * cp.quantity)
      end
      self.save(validate: false)
    end
  end
end
