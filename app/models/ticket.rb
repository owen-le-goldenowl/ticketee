class Ticket < ApplicationRecord
  belongs_to :project
  validates_presence_of :title, :description
  validates_length_of :description, minimum: 10
  belongs_to :user
end
