class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.integer :user_id, default: 0, null: false
      t.string :title, null: false, default: ""
      t.text :body, null: false, default: ""

      t.timestamps
    end
    add_index :episodes, :title
  end
end
