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


	private

	def pile_params
		params.require(:pile).permit(:name)
	end
end
