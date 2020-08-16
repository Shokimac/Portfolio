class CreateDroppedLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :dropped_letters do |t|
      t.text :body, null: false

      t.timestamps
    end
  end
end
