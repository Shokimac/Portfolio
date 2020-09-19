require 'rails_helper'

describe "[ユーザー関連]非ログイン時" do
    let(:user) { create(:user) }
    context "以下にはアクセスできない" do
        
        it 'ユーザープロフィールページ' do
            get user_path(user)
            expect(response).to have_http_status 302
        end

        it 'ユーザー編集ページ' do
            get edit_user_path(user)
            expect(response).to have_http_status 302
        end

        it 'お気に入りページ' do
            get user_bookmarks_path(user)
            expect(response).to have_http_status 302
        end

        it 'ユーザー退会確認ページ' do
            get user_withdrawal_path(user)
            expect(response).to have_http_status 302
        end

        it 'ユーザー退会機能' do
            patch user_withdrawal_path(user)
            expect(response).to have_http_status 302
        end
    end
    
end
