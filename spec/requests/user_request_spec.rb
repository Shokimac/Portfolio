require 'rails_helper'

describe "ログインしていない時" do
    let(:user) { create(:user) }
    context "次のページにはアクセスできない" do
        
        it 'ユーザープロフィールページ' do
            get user_path(user)
            expect(response).to have_http_status 302
        end
    end
    
end
