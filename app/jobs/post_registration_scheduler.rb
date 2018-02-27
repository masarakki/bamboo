require 'sidekiq-scheduler'

class PostRegistrationScheduler
  include Sidekiq::Worker

  def perform
    User.votable.each do |user|
      PostStatusWorker.perform_async(user.id)
    end
  end
end
