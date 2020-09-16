require 'rails_helper'

describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
        before do
            visit new_user_registration_path
        end
        context '新規登録画面に遷移' do
            it '新規登録に成功する' do
                fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
                fill_in 'user[email]', with: Faker::Internet.email
                fill_in 'user[password]', with: 'password'
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '登録'

                expect(page).to have_content 'successfully'
            end
            
            it '新規登録に失敗する' do
                fill_in 'user[name]', with: ''
                fill_in 'user[email]', with:''
                fill_in 'user[password]', with:''
                fill_in 'user[password_confirmation]', with:''
                click_button '登録'

                expect(page).to have_content 'error'
            end
        end
    end

    describe 'ユーザーログイン' do
        let(:user) { create(:user) }
        before do
            visit new_user_session_path
        end
        context 'ログイン画面に遷移' do
            let(:test_user) { user }
            it 'ログインに成功する' do
                fill_in 'user[email]',	with: test_user.email
                fill_in 'user[password]',	with: test_user.password
                click_button 'ログイン'

                expect(current_path).to eq(dropped_letter_path)
            end

            it 'ログインに失敗する' do
                fill_in 'user[email]', with: ''
                fill_in 'user[password]', with: ''
                click_button 'ログイン'

                expect(current_path).to eq(new_user_session_path)
            end
        end
    end
end

describe "ユーザーのテスト" do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end

    describe 'プロフィールページのテスト' do
        context '本人アクセス時の表示確認' do
            it 'プロフィール画像が表示される' do
                visit user_path(user)
                expect(page).to have_css('.userProfile__image')
            end

            it '自己紹介が表示される' do
                visit user_path(user)
                expect(page).to have_content(user.introduction)
            end

            it '本人ログイン時、プロフィール編集ボタンが表示される' do
                visit user_path(user)
                expect(page).to have_link 'プロフィール編集', href: edit_user_path(user)
            end

            it '本人ログイン時、お気に入りボタンが表示される' do
                visit user_path(user)
                expect(page).to have_link 'お気に入り一覧'
            end
        end

        context '本人以外のユーザーアクセス時の表示確認' do
            
            it 'プロフィール画像が表示される' do
                visit user_path(user2)
                expect(page).to have_css('.userProfile__image')
            end

            it '自己紹介が表示される' do
                visit user_path(user2)
                expect(page).to have_content(user2.introduction)
            end

            it 'プロフィール編集ボタンが表示されない' do
                visit user_path(user2)
                expect(page).to have_no_link 'プロフィール編集', href: edit_user_path(user)
            end

            it 'お気に入りボタンが表示されない' do
                visit user_path(user2)
                expect(page).to have_no_link 'お気に入り一覧', href: user_bookmarks_path(user)
            end
        end
    end
    
end
