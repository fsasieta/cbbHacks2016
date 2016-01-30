class FlashcardsController < ApplicationController
	def create
		
		@flashcard = Flashcard.create(flashcard_params)
		@flashcards = Flashcard.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@flashcards = Flashcard.all
	end


	private

	def flashcard_params
		params.require(:flashcard).permit(:info, :pile_id)
	end
end
