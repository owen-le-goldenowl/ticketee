class Comment < ApplicationRecord
  validates_presence_of :text

  belongs_to :user
  belongs_to :ticket
  belongs_to :state

  after_create :set_ticket_state

  delegate :project, to: :ticket, allow_nil: true

  private

  def set_ticket_state
    ticket.state = state
    ticket.save!
  end
end
