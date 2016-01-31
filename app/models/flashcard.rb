class Flashcard < ActiveRecord::Base
	has_many :answers
	belongs_to :pile
end
