class ChangeDataBodyToDroppedLetters < ActiveRecord::Migration[5.2]
  def change
    change_column :dropped_letters, :body, :text, null: false
  end
end
