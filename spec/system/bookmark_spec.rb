require 'rails_helper'

describe "ブックマーク" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user2_episode) { create(:episode, user: user2) }
    let!(:user2_proverb) { create(:proverb, user: user2) }

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end

    context "お気に入り一覧画面表示確認" do
        before do
            visit episode_path(user2_episode)
            click_link 

            visit user_bookmarks_path(user)
        end

        it '「ユーザー名 さんのお気に入り」と表示されている' do
            expect(page).to have_content("#{user.name} さんのお気に入り") 
        end

        it '「お気に入りのエピソード」と表示されている' do
            expect(page).to have_content('お気に入りのエピソード')
        end
    end
    
end
