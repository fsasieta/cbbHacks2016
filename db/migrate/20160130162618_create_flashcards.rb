class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|

      t.string :info
      t.timestamps null: false
    end
  end
end
