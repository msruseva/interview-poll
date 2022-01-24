class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :question

	#counter_culture :vote_option
end
