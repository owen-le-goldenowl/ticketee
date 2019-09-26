class Comment < ApplicationRecord
  validates_presence_of :text
  belongs_to :user
  belongs_to :ticket
  after_create :sidekiq_perform

  private

  def sidekiq_perform
    byebug
    (self.ticket.watchers - [self.user]).each do |u|
      CommentWorker.perform_async(self.id, u.id)
    end
  end
end
