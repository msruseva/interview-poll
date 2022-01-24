class User < ApplicationRecord
	has_secure_password
	has_many :questions, dependent: :destroy
  has_many :votes, dependent: :destroy

  def voted_for?(poll)
    votes.any? { |vote| vote.question.poll == poll }
  end
end
