require 'rails_helper'

describe "ブックマーク" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user3) { create(:user) }
    let!(:user2_episode) { create(:episode, user: user2) }
    let!(:user3_proverb) { create(:proverb, user: user3) }
    let!(:episode_bookmark) { create(:episode_bookmark, user: user, episode: user2_episode) }
    let!(:proverb_bookmark) { create(:proverb_bookmark, user: user, proverb: user3_proverb) }

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit user_bookmarks_path(user)
    end

    context "お気に入り一覧画面表示確認" do

        it '「ユーザー名 さんのお気に入り」と表示されている' do
            expect(page).to have_content("#{user.name} さんのお気に入り") 
        end

        it '「お気に入りのエピソード」と表示されている' do
            expect(page).to have_content('お気に入りのエピソード')
        end

        it 'お気に入り登録したエピソードタイトルが表示されている' do
            expect(page).to have_content user2_episode.title
        end

        it 'お気に入り登録したエピソードを投稿したユーザー名が表示されている' do
            expect(page).to have_content user2.name 
        end

        it 'お気に入り登録した日にちが表示されている' do
            expect(page).to have_content episode_bookmark.updated_at.strftime("%Y-%m-%d")
        end

        it '「お気に入りの格言」と表示されている' do
            expect(page).to have_content('お気に入りの格言')
        end

        it 'お気に入り登録した格言の格言主名が表示されている' do
            expect(page).to have_content user3_proverb.name
        end

        it 'お気に入り登録した格言を投稿したユーザー名が表示されている' do
            expect(page).to have_content user3.name 
        end

        it 'お気に入り登録した日にちが表示されている' do
            expect(page).to have_content proverb_bookmark.updated_at.strftime("%Y-%m-%d")
        end
    end    
    
end
