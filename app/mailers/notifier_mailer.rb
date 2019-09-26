class NotifierMailer < ApplicationMailer
  def test_mail
    subject = 'subject sample'
    mail(to: 'user@sample.com', subject: subject)
  end

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    @ticket = @comment.ticket
    @project = @ticket.project
    subject = "[ticketee] #{@project.name} - #{@ticket.title}"
    mail(to: @user.email, subject: subject)
  end
end
