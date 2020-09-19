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
    let!(:proverb) { create(:proverb, user: user2) }

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

end
