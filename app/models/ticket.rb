class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments
  belongs_to :state

  validates_presence_of :title, :description
  validates_length_of :description, minimum: 10
  mount_uploaders :assets, AssetUploader
end
