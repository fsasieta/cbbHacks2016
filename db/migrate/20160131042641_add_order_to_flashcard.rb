class AddOrderToFlashcard < ActiveRecord::Migration
  def change
  	add_column :flashcards, :order, :integer
  end
end
