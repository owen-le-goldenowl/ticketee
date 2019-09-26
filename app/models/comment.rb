class Comment < ApplicationRecord
  validates_presence_of :text
  belongs_to :user
  belongs_to :ticket
  after_create :send_comment_updated_mail

  private

  def send_comment_updated_mail
    (ticket.watchers - [user]).each do |u|
      NotifierMailer.comment_updated(self, u).deliver
    end
  end
end
