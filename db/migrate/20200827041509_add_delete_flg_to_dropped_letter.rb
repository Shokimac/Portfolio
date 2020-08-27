class AddDeleteFlgToDroppedLetter < ActiveRecord::Migration[5.2]
  def change
    add_column :dropped_letters, :delete_flg, :boolean, default: false, null: false
  end
end
