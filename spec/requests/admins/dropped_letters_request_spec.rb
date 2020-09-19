require 'rails_helper'

describe "管理者[エピソード関連] 非ログイン時" do
    let(:user) { create(:user) }
    let(:letter) { create(:dropped_letter) }

    context "以下のアクションにはアクセスできない" do
        
        it '落とし文一覧画面' do
            get admins_dropped_letters_path
            expect(response).to have_http_status 302
        end
        
        it '落とし文投稿アクション' do
            post admins_dropped_letters_path
            expect(response).to have_http_status 302
        end
        
        it '落とし文編集画面' do
            get edit_admins_dropped_letter_path(letter)
            expect(response).to have_http_status 302
        end
        
        it '落とし文更新アクション' do
            get admins_dropped_letter_path(letter)
            expect(response).to have_http_status 302
        end
    end

end