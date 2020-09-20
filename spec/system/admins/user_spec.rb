require 'rails_helper'

describe "管理者認証" do
    describe "管理者ログイン" do
        context "ログインテスト" do
            
            it '成功する' do
                visit new_admin_session_path
                fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
                fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
                click_button 'ログイン'
                expect(page).to have_content('Signed in successfully.')
            end

            it '失敗する' do
                visit new_admin_session_path
                fill_in "admin[email]",	with: ""
                fill_in "admin[password]",	with: ""
                click_button 'ログイン'
                expect(current_path).to eq new_admin_session_path
            end
        end
    end

    describe "管理者作成" do
        context "管理者新規登録画面" do
            it '遷移できない' do
                expect {
                    visit '/admins/sign_up'
                }.to raise_error('No route matches [GET] "/admins/sign_up"')
            end
        end
    end
end

describe "管理者 ユーザー関連のテスト" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user4) { create(:user) }
    let!(:episode) { create(:episode, user: user) }
    let!(:proverb) { create(:proverb, user: user) }
    let!(:user2_proverb) { create(:proverb, user: user2) }

    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
    end

    context "ユーザー 一覧の表示確認" do
        before do
            visit admins_users_path
        end

        it 'ラベルに「ユーザー名」と表示されている' do
            expect(page).to have_content('ユーザー名') 
        end

        it 'ラベルに「メールアドレス」と表示されている' do
            expect(page).to have_content('メールアドレス') 
        end

        it 'ラベルに「投稿エピソード件数」と表示されている' do
            expect(page).to have_content('投稿エピソード件数') 
        end

        it 'ラベルに「投稿格言数」と表示されている' do
            expect(page).to have_content('投稿格言数') 
        end

        it 'ラベルに「退会済フラグ」と表示されている' do
            expect(page).to have_content('退会済フラグ') 
        end

        it 'ユーザーのプロフィール画像が表示されている' do
            expect(page).to have_css '.userIndex' 
        end

        it 'ユーザー名が表示されている' do
            expect(page).to have_content user.name 
        end

        it 'メールアドレスが表示されている' do
            expect(page).to have_content user.email 
        end

        it '投稿エピソード件数が表示されている' do
            expect(page).to have_content user.episodes.count
        end

        it '投稿格言数が表示されている' do
            expect(page).to have_content user.proverbs.count
        end

        it '退会フラグが表示されている' do
            expect(page).to have_css('.userIndex__body--check')
        end
    end

    context "ユーザー 一覧画面のリンク確認" do
        before do
            visit admins_users_path
        end

        it 'ユーザー名をクリックしてプロフィールへ飛べる' do
            click_link user.name
            expect(current_path).to eq admins_user_path(user)
        end
    end

    context "プロフィールページの表示確認" do
        before do
            visit admins_user_path(user)
        end

        it '「ユーザー名 さんのプロフィール」と表示される' do
            expect(page).to have_content("#{user.name} さんのプロフィール")
        end

        it 'ユーザーのプロフィール画像が表示されている' do
            expect(page).to have_css '.userProfile__image' 
        end

        it '「自己紹介」と表示される' do
            expect(page).to have_content('自己紹介') 
        end

        it '自己紹介文が表示される' do
            expect(page).to have_content user.introduction 
        end

        it '「ユーザー名 さんが投稿したエピソード」と表示される' do
            expect(page).to have_content("#{user.name} さんが投稿したエピソード") 
        end

        it 'エピソードが投稿された日時が表示されている' do
            expect(page).to have_content episode.updated_at.strftime("%Y-%m-%d %H:%M")
        end

        it 'エピソードのタイトルが表示されている' do
            expect(page).to  have_content episode.title
        end

        it '「ユーザー名 さんが投稿した格言」と表示される' do
            expect(page).to have_content("#{user.name} さんが投稿した格言") 
        end

        it '格言が投稿された日時が表示されている' do
            expect(page).to have_content proverb.updated_at.strftime("%Y-%m-%d %H:%M")
        end

        it '格言主名が表示されている' do
            expect(page).to  have_content proverb.name
        end

        it '退会ボタンが表示されている' do
            expect(page).to have_button '退会する' 
        end

    end

    context "プロフィールページの各リンク先が正しい" do
        before do
            visit admins_user_path(user)
        end

        it 'タイトルからエピソード詳細画面へ飛べる' do
            click_link episode.title
            expect(current_path).to eq admins_episode_path(episode)
        end

        it '格言主名から格言詳細画面へ飛べる' do
            click_link proverb.name
            expect(current_path).to eq admins_proverb_path(proverb)
        end
    end

    context "プロフィールページの退会ボタンテスト" do
        before do
            visit admins_user_path(user)
        end

        it "退会できる" do
            click_button '退会する'
            expect(current_path).to eq admins_users_path 
        end

        it '退会復帰する' do
            click_button '退会する'
            visit admins_user_path(user)
            click_button '退会解除'
            expect(current_path).to eq admins_users_path 
        end
        
    end
    
    
    
    
end
