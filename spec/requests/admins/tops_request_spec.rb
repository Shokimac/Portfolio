require 'rails_helper'

describe "管理者[格言関連] 非ログイン時" do
    context "以下のアクションにはアクセスできない" do
        it 'トップ画面' do
            get admins_top_path
            expect(response).to have_http_status 302
        end
    end

end