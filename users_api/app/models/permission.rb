class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  validates :action, presence: true, uniqueness: true
end
