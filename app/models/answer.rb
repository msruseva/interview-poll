class Answer < ActiveRecord::Base
	belongs_to :question, optional: true
	has_many :responses, dependent: :destroy
end
