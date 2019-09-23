class User < ApplicationRecord
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :name

  scope :admins, -> { where(admin: true) }
end
