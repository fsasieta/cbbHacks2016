class AnswersController < ApplicationController
	def create

		@answer = Answer.create(answer_params)

		respond_to do |format|
			format.js
		end

	end


	private

	def answer_params
		params.require(:answer).permit(:name, :correct, :flashcard_id)
	end
end
