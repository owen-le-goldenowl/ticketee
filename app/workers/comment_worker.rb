class CommentWorker
  include Sidekiq::Worker

  def perform(comment_id, user_id)
    NotifierMailer.comment_updated(comment_id, user_id).deliver
  end
end
