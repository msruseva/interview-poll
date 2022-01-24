class Question < ActiveRecord::Base
	belongs_to :poll, optional: true
	has_many :votes, dependent: :destroy
	has_many :users, through: :votes
	has_many :answers, class_name: 'Answer', dependent: :destroy

	accepts_nested_attributes_for :answers, allow_destroy: true
end
