class Answer < ActiveRecord::Base
	belongs_to :question, optional: true
end
