class Provider < ApplicationRecord
  has_paper_trail

  has_many :documents, as: :documentable, dependent: :destroy
  has_many :phones, as: :phonable, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :accounts, as: :accountable, dependent: :destroy

  has_many :supplies
  has_many :products, through: :supplies, source: :suppliable, source_type: 'Product'
  has_many :tasks, through: :supplies, source: :suppliable, source_type: 'Task'

  accepts_nested_attributes_for :documents, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :accounts, allow_destroy: true

  validates :cpf, :cpf => true, allow_blank: true
  validates :cnpj, :cnpj => true
  validates :name, :nickname, presence: true
end
