require 'rails_helper'

describe "TOP画面" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:episode) { create(:episode, user: user) }
    let!(:proverb) { create(:proverb, user: user2) }

    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
        visit admins_tops_top_path
    end

    context "表示確認" do

        it '「エピソード一覧」と表示されている' do
            expect(page).to have_content('エピソード一覧') 
        end

        it '投稿ユーザーのプロフィール画像が表示されている' do
            expect(page).to have_css '.episodeBlock__image' 
        end

        it '投稿ユーザー名が表示されている' do
            expect(page).to have_content user.name 
        end

        it 'エピソードの投稿日付が表示されている' do
            expect(page).to have_content episode.updated_at.strftime("%Y-%m-%d")
        end

        it 'エピソードの投稿タイトルが表示されている' do
            expect(page).to have_content episode.title 
        end

        it '「格言一覧」と表示されている' do
            expect(page).to have_content('格言一覧') 
        end

        it '投稿ユーザーのプロフィール画像が表示されている' do
            expect(page).to have_css '.proverbBlock__image' 
        end

        it '投稿ユーザー名が表示されている' do
            expect(page).to have_content user2.name 
        end

        it '格言の投稿日付が表示されている' do
            expect(page).to have_content proverb.updated_at.strftime("%Y-%m-%d")
        end

        it '「格言主名 の格言」と表示されている' do
            expect(page).to have_content("#{proverb.name} の格言") 
        end
    end
    
end
