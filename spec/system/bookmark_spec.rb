require 'rails_helper'

describe "ブックマーク" do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:user2_episode) { create(:episode, user: user2) }
    let(:user2_proverb) { create(:proverb, user: user2) }

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end
    
end
