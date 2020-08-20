class Contract < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  belongs_to :unit
  belongs_to :task
  belongs_to :entry, dependent: :destroy, optional: true

  monetize :value_cents

  scope :unit_tree, ->(param) do
    uid, boolean = param.split(",")
    if boolean == "true"
      joins(:unit).where(units: { id: Unit.find(uid).subtree_ids })
    else
      joins(:unit).where(units: { id: uid })
    end
  end

  def self.ransackable_scopes(auth_object = nil)
    [:unit_tree]
  end

  after_create :create_entry

  def create_entry
    e = Entry.new(unit: self.unit, kind: 'out', entry_description: EntryDescription.find_or_create_by(name: "Contrato de Serviço"), moment: self.moment, user_id: self.user_id, value: self.value)
    e.save
    self.entry = e
    self.save
  end
end
