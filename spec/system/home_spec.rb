require 'rails_helper'

describe 'トップ画面表示の確認' do
    let(:user) { create(:user) }
    before do
        visit root_path
    end

    context "未ログイン時" do
        it 'ログインボタンが表示＆リンク先が正しい' do
            expect(page).to have_link 'ログインはこちら', href: new_user_session_path
            click_link 'ログインはこちら'
            expect(current_path).to eq(new_user_session_path)
        end

        it '新規登録ボタンが表示＆リンク先が正しい' do
            expect(page).to have_link '新規登録はこちら'
            click_link '新規登録はこちら', href: new_user_registration_path
            expect(current_path).to eq(new_user_registration_path)
        end
    end

    context "ログイン時" do
        before do
            visit new_user_session_path
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: user.password
            click_button 'ログイン'
        end

        it '「みんなのエピソードへ」ボタン表示＆リンク先が正しい' do
            expect(page).to have_link 'みんなのエピソードへ', href: episodes_path
            click_link 'みんなのエピソードへ'
            expect(current_path).to eq episodes_path 
        end

        it '「みんなの格言へ」ボタン表示＆リンク先が正しい' do
            expect(page).to have_link 'みんなの格言へ', href: proverbs_path
            click_link 'みんなの格言へ'
            expect(current_path).to eq proverbs_path
        end
    end
end

describe "天狗の落とし文" do
    let(:user) { create(:user) }

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit dropped_letter_path
    end

    context "画面表示の確認" do
        it '「天ちゃんの落とし文」と表示される' do
            expect(page).to have_content('天ちゃんの落とし文') 
        end

        it '落とし文が表示される' do
            expect(page).to have_content "テスト"
        end

        it '天狗のイラストが表示される' do
            expect(page).to have_css('.letter__icon') 
        end

        it 'エピソードページへのボタンが表示される' do
            expect(page).to have_link 'みんなのエピソードへ' 
        end

        it 'ボタンのリンク先が正しい' do
            click_link 'みんなのエピソードへ'
            expect(current_path).to eq episodes_path 
        end

        it '格言へのボタンが表示される' do
            expect(page).to have_link 'みんなの格言へ' 
        end

        it 'ボタンのリンク先が正しい' do
            click_link 'みんなの格言へ'
            expect(current_path).to eq proverbs_path 
        end

    end
    
end
