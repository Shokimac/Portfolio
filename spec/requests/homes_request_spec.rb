require 'rails_helper'

describe "[天狗の落とし文]非ログイン時" do
    
    context "以下のアクションにはアクセスできない" do
        it '天狗の落とし文ページ' do
            get dropped_letter_path
            expect(response).to have_http_status 302
        end
    end
end
    