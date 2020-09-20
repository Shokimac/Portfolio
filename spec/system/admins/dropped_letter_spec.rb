require 'rails_helper'

describe "管理者 落とし文関連のテスト" do
    let!(:letter) { create(:dropped_letter) }
    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
    end

    describe "落とし文一覧画面" do
        
        context "表示確認" do

        before do
            visit admins_dropped_letters_path
        end
        
        it '「落とし文一覧」と表示される' do
            expect(page).to have_content('落とし文一覧') 
        end

        it '「新規投稿」と表示されている' do
            expect(page).to have_content('新規投稿') 
        end

        it '新規投稿フォームが表示されている' do
            expect(page).to have_field 'dropped_letter[body]' 
        end

        it '投稿ボタンが表示されている' do
            expect(page).to have_button '投稿' 
        end

        it '投稿した落とし文が表示されている' do
            expect(page).to have_content letter.body
        end

        it '非表示フラグが立っている落とし文には非表示と出る' do
            expect(page).to have_content('非表示') 
        end

        it '編集ボタンが表示されている' do
            expect(page).to have_link '編集' 
        end
    end

    context "リンク先の確認" do
        before do
            visit admins_dropped_letters_path
        end

        it '編集ボタンのリンク先が正しい' do
            click_link 'letter0'
            expect(current_path).to eq edit_admins_dropped_letter_path(letter) 
        end
    end

    context "新規投稿テスト" do
        before do
            visit admins_dropped_letters_path
        end

        it '成功する' do
            fill_in "dropped_letter[body]",	with: "落とし文投稿テストです。"
            click_button '投稿'
            expect(page).to have_content('落とし文投稿テストです。') 
        end

        it '失敗する' do
            fill_in "dropped_letter[body]",	with: ""
            click_button '投稿'
            expect(page).to have_content("can't be blank") 
        end
    end
end
end

describe "落とし文編集画面" do
    let(:letter) { create(:dropped_letter) }
    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
        visit edit_admins_dropped_letter_path(letter)
    end

    context "表示確認" do
        
        it '「落とし文編集」と表示されている' do
            expect(page).to have_content('落とし文編集') 
        end

        it '落とし文入力フォームが表示されている' do
            expect(page).to have_field 'dropped_letter[body]', with: letter.body
        end

        it 'ラベルに「表示ステータス」と表示されている' do
            expect(page).to have_content('表示ステータス') 
        end

        it 'ラジオボタンの表示側がデフォルトでチェック' do
            expect(page).to have_checked_field '表示'
        end

        it 'ラジオボタンの非表示側はチェックされていない' do
            expect(page).to_not have_checked_field '非表示'
        end

        it '更新ボタンが表示されている' do
            expect(page).to have_button '更新' 
        end
    end

    context "編集アクション" do
        
        it '成功する' do
            fill_in "dropped_letter[body]",	with: Faker::Lorem.characters(number:10)
            click_button '更新'
            expect(current_path).to eq admins_dropped_letters_path 
        end

        it '失敗する' do
            fill_in "dropped_letter[body]",	with: ""
            click_button '更新'
            expect(page).to have_content("can't be blank") 
        end
    end
    
    
end