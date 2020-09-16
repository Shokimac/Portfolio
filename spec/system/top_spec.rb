require 'rails_helper'

describe 'トップ画面表示の確認' do
    let!(:user) { create(:user) }

    context "未ログイン時" do
        before do
            visit root_path
        end
        it 'ログインボタンが表示＆リンク先が正しい' do
            expect(page).to have_link 'ログインはこちら', href:new_user_session_path
            click_link 'ログインはこちら'
            expect(current_path).to eq(new_user_session_path)
        end

        it '新規登録ボタンが表示＆リンク先が正しい' do
            expect(page).to have_link '新規登録はこちら'
            click_link '新規登録はこちら', href:new_user_registration_path
            expect(current_path).to eq(new_user_registration_path)
        end

    end
    
end