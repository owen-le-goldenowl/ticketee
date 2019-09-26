class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :watchers,class_name: 'User',join_table: 'ticket_watchers'

  validates_presence_of :title, :description
  validates_length_of :description, minimum: 10
  mount_uploaders :assets, AssetUploader

  after_create :creator_watches_me

  private

  def creator_watches_me
    if user
      self.watchers << user unless self.watchers.include?(user)
    end
  end
end
