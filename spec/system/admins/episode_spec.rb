require 'rails_helper'

describe '管理者 エピソード関連のテスト' do
    let(:user) { create(:user) }
    let(:episode) { create(:episode, user: user) }

    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
        visit admins_episode_path(episode)
    end

    context "エピソード詳細画面表示確認" do
        
        it '「エピソード詳細」と表示されている' do
            expect(page).to have_content('エピソード詳細') 
        end

        it '投稿ユーザー名が表示されている' do
            expect(page).to have_content user.name 
        end

        it '投稿ユーザーのプロフィール画像が表示されている' do
            expect(page).to have_css '.leftSide__image' 
        end

        it '「タイトル」と表示されている' do
            expect(page).to have_content('タイトル') 
        end

        it 'エピソードのタイトルが表示されている' do
            expect(page).to have_content episode.title 
        end

        it '「内容」と表示されている' do
            expect(page).to have_content('内容') 
        end

        it 'エピソードの内容が表示されている' do
            expect(page).to have_content episode.body 
        end

        it '削除ボタンが表示されている' do
            expect(page).to have_link '削除する' 
        end
    end
    
end
