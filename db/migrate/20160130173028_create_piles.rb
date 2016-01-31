class CreatePiles < ActiveRecord::Migration
  def change
    create_table :piles do |t|

      t.string :name

      t.timestamps null: false
    end
  end
end
