class RemoveBodyFromDroppedLetters < ActiveRecord::Migration[5.2]
  def change
    remove_column :dropped_letters, :body, :text
  end
end
