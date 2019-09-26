class NotifierMailer < ApplicationMailer
  def test_mail
    subject = 'subject sample'
    mail(to: 'user@sample.com', subject: subject)
  end

  def comment_updated(comment_id, user_id, comment_creator_id)
    @comment = Comment.find(comment_id)
    @user = User.find(user_id)
    @comment_creator = User.find(comment_creator_id)
    @ticket = @comment.ticket
    @project = @ticket.project
    subject = "[ticketee] #{@project.name} - #{@ticket.title}"
    mail(to: @user.email, subject: subject)
  end
end
