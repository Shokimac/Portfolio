class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id, default: 0, null: false
      t.integer :proverb_id, default: 0, null: false
      t.string :comment, null: false, default: ""

      t.timestamps
    end
  end
end
