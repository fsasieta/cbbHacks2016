class AddPileIdToFlashcard < ActiveRecord::Migration
  def change
  	add_column :flashcards, :pile_id, :integer
  end
end
