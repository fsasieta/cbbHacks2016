class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.string :name
      t.boolean :correct
      t.integer :flashcard_id
      t.timestamps null: false
    end
  end
end
