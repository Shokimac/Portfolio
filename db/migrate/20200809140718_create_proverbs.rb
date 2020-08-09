class CreateProverbs < ActiveRecord::Migration[5.2]
  def change
    create_table :proverbs do |t|
      t.integer :user_id, default: 0, null: false
      t.string :name, null: false, default: ""
      t.text :body, null: false, default: ""

      t.timestamps
    end
  end
end
