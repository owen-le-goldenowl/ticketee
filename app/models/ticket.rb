class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :assets, dependent: :destroy
  accepts_nested_attributes_for :assets

  validates_presence_of :title, :description
  validates_length_of :description, minimum: 10



end
