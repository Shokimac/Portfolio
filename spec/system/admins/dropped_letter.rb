require 'rails_helper'

describe "管理者 落とし文関連のテスト" do

    let(:letter) { DroppedLetter.first }
    let(:letter2) { DroppedLetter.second }
    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
    end

    context "落とし文一覧画面の表示確認" do

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
            expect(page).to have_field 'letter[body]' 
        end

        it '投稿ボタンが表示されている' do
            expect(page).to have_button '投稿' 
        end

        it '投稿した落とし文が表示されている' do
            expect(page).to have_content letter.body 
            expect(page).to have_content letter2.body 
        end

        it '編集ボタンが表示されている' do
            expect(page).to have_link '編集' 
        end
    end
    
end
