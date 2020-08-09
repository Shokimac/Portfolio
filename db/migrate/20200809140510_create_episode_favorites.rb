class CreateEpisodeFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :episode_favorites do |t|
      t.integer :user_id, default: 0, null: false
      t.integer :episode_id, default: 0, null: false

      t.timestamps
    end
  end
end
