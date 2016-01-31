class PilesController < ApplicationController
	def index
		@pile = Pile.new

		@piles = Pile.all
	end	

	def create
		@pile = Pile.create(pile_params)

		@piles = Pile.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@pile = Pile.find(params[:id])

		@flashcard = Flashcard.new
		@flashcards = @pile.flashcards

		@answer = Answer.new
	end

	def study
		@pile = Pile.find(params[:id])
		@flashcards = @pile.flashcards
	end

	private

	def pile_params
		params.require(:pile).permit(:name)
	end
end
