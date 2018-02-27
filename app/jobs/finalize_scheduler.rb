require 'sidekiq-scheduler'

class FinalizeScheduler
  include Sidekiq::Worker

  def perform
    User.delete_all
  end
end
