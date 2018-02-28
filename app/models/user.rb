class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[twitter]

  scope :votable, -> { not_voted.or(vote_expired).where.not(vote_id: nil) }

  scope :vote_expired, -> { where(arel_table[:voted_at].lt(24.hours.ago)) }
  scope :not_voted, -> { where(voted_at: nil) }

  def self.from_auth(auth)
    uid, credentials = [auth.uid, auth.credentials]
    (find_by(uid: uid) || User.new(uid: uid)).tap do |user|
      user.update(screen_name:  auth.info.nickname,
                  access_token: credentials.token,
                  secret_token: credentials.secret)
    end
  end

  def vote
    Vote.find(vote_id)
  end

  def vote?
    vote_id.present?
  end
end
