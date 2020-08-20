class User < ApplicationRecord
  has_paper_trail

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :new_role_title, :new_role_unit

  has_many :responsabilities
  has_many :profiles, through: :responsabilities
  has_many :permissions, through: :profiles

  def the_name
    self.name.blank? ? self.email : self.name
  end
end
