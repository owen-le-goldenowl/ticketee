class User < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password
  validates_presence_of :name, :email, :password
end
