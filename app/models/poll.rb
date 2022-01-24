class Poll < ActiveRecord::Base
	has_many :questions, class_name: 'Question', dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true

	validates_presence_of :name, presence: true
end
