class PostStatusWorker
  include Sidekiq::Worker

  def perform(id)
    user = User.votable.find(id)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_APP_ID']
      config.consumer_secret = ENV['TWITTER_APP_SECRET']
      config.access_token = user.access_token
      config.access_token_secret = user.secret_token
    end
    vote = Vote.find(user.vote_id)
    client.update(vote.status_message)
    user.update(voted_at: Time.now)
  rescue ActiveRecord::RecordNotFound
    true
  end
end
