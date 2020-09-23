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
                expect(page).to have_content 'アカウント登録が完了しました。'
            end
            
            it '新規登録に失敗する' do
                fill_in 'user[name]', with: ''
                fill_in 'user[email]', with:''
                fill_in 'user[password]', with:''
                fill_in 'user[password_confirmation]', with:''
                click_button '登録'

                expect(page).to have_content 'Eメールを入力してください'
                expect(page).to have_content 'パスワードを入力してください'
                expect(page).to have_content 'ユーザー名を入力してください'
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

    describe 'プロフィール編集のテスト' do
        context '他人の編集画面' do
            it 'アクセスできない' do
                visit edit_user_path(user2)
                expect(current_path).to eq('/users/' + user.id.to_s)  
            end
        end

        context '自分の編集画面' do
            it 'アクセスできる' do
                visit edit_user_path(user)
                expect(current_path).to eq('/users/' + user.id.to_s + '/edit')  
            end

            it '編集できる' do
                visit edit_user_path(user)
                click_button '更新'
                expect(current_path).to eq(user_path(user))  
            end
            
            it '編集に失敗する' do
                visit edit_user_path(user)
                fill_in "user[name]",	with: ""
                fill_in "user[introduction]",	with: ""
                click_button '更新'
                expect(page).to have_content('ユーザー名を入力してください') 
            end
        end

        context 'パスワード変更' do
            it '成功' do
                visit edit_user_registration_path
                fill_in '現在のパスワード',	with: user.password
                fill_in '新しいパスワード',	with: 'aiueoka'
                fill_in 'パスワード確認入力', with: "aiueoka"
                click_button 'Update'
                expect(page).to have_content 'アカウント情報を変更しました。'
            end

            it '失敗' do
                visit edit_user_registration_path
                fill_in '現在のパスワード',	with: ''
                fill_in '新しいパスワード',	with: 'password'
                fill_in 'パスワード確認入力', with: "password"
                click_button 'Update'
                expect(page).to have_content '現在のパスワードを入力してください'
            end
        end

        context "退会" do
            it '退会確認画面にアクセスできる' do
                visit edit_user_path(user)
                click_link '退会する'
                expect(current_path).to eq(user_withdrawal_path(user)) 
            end

            it '退会できる' do
                visit user_withdrawal_path(user)
                click_button '退会する'
                expect(current_path).to eq(root_path) 
            end

            it '退会しないボタンのリンク先が正しい' do
                visit user_withdrawal_path(user)
                click_link '退会しない'
                expect(current_path).to eq(user_path(user)) 
            end
        end
        
        context "表示の確認" do
            before do
                visit edit_user_path(user)
            end

            it '画像投稿フォームが表示される' do
                expect(page).to have_field 'user[image]'
            end

            it '入力フォームに自分の名前が表示される' do
                expect(page).to have_field 'ユーザー名', with: user.name
            end

            it 'ユーザーのメールアドレスが表示される' do
                expect(page).to have_content user.email
            end

            it '自己紹介フォームに自分の自己紹介文が表示される' do
                expect(page).to have_field '自己紹介', with: user.introduction
            end
        end
    end
    
end
