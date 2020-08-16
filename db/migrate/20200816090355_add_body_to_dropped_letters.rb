class AddBodyToDroppedLetters < ActiveRecord::Migration[5.2]
  def change
    add_column :dropped_letters, :body, :text
  end
end
