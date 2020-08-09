class CreateProverbFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :proverb_favorites do |t|
      t.integer :user_id, default: 0, null: false
      t.integer :proverb_id, default: 0, null: false

      t.timestamps
    end
  end
end
