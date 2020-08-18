class AddIntroductionToProverbs < ActiveRecord::Migration[5.2]
  def change
    add_column :proverbs, :introduction, :text
  end
end
