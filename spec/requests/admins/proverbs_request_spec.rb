require 'rails_helper'

describe "管理者[格言関連] 非ログイン時" do
    let(:user) { create(:user) }
    let(:proverb) { create(:proverb, user: user) }

    context "以下のアクションにはアクセスできない" do
        
        it '格言詳細ページ' do
            get admins_proverb_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言削除アクション' do
            delete admins_proverb_path(proverb)
            expect(response).to have_http_status 302
        end
    end
end