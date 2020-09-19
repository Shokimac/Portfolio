require 'rails_helper'

    describe "管理者[ユーザー関連] 非ログイン時" do
    let!(:user) { create(:user) }
    
    context '以下のアクションにアクセスできない' do
        it 'ユーザー 一覧ページ' do
            get admins_users_path
                expect(response).to have_http_status 302
            end
            
            it 'ユーザー詳細ページ' do
                get admins_user_path(user)
                expect(response).to have_http_status 302
            end
            
            it 'ユーザー退会アクション' do
                patch admins_user_withdrawal_path(user)
                expect(response).to have_http_status 302
            end
            
            it 'ユーザー退会復帰アクション' do
                patch admins_user_return_path(user)
                expect(response).to have_http_status 302
            end
        end
    end