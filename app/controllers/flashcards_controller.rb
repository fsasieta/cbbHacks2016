class FlashcardsController < ApplicationController
	def create
		@pile = Pile.find(params[:flashcard][:pile_id])

		@flashcard = Flashcard.create(flashcard_params)
		@flashcard.update_attributes(order: @pile.flashcards.count )
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
		params.require(:flashcard).permit(:info, :pile_id, :order)
	end
end
