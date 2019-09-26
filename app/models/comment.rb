class Comment < ApplicationRecord
  validates_presence_of :text
  belongs_to :user
  belongs_to :ticket
  after_create :creator_watches_ticket
  after_create :sidekiq_perform

  private

  def creator_watches_ticket
    self.ticket.watchers << self.user
  end

  def sidekiq_perform
    (self.ticket.watchers - [self.user]).each do |u|
      CommentWorker.perform_async(self.id, u.id, user.id)
    end
  end

end
